#!/bin/bash
## associative array for job status
#declare -A PARALLEL_JOBS
export PARALLEL_JOBS=()

## run command in the background
parallel() {
  # echo ${@}
  eval ${1} & PARALLEL_JOBS[$!]="${1}"
}

clear_parallel_jobs() {
  PARALLEL_JOBS=()
}

## check exit status of each job
## preserve exit status in ${PARALLEL_JOBS}
## returns 1 if any job failed
wait_and_check_parallel() {
  local cmd
  local status=0
  # expend keys in the JOBS array
  echo "jobs: ${!PARALLEL_JOBS[@]}"
  for pid in ${!PARALLEL_JOBS[@]}; do
    cmd=${PARALLEL_JOBS[${pid}]}
    wait ${pid} ; PARALLEL_JOBS[${pid}]=$?
    if [[ ${PARALLEL_JOBS[${pid}]} -ne 0 ]]; then
      status=${PARALLEL_JOBS[${pid}]}
      echo -e "[${pid}] Exited with status: ${status}\n${cmd}"
    fi
  done
  return ${status}
}
