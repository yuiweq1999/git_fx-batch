#!/bin/bash
# 每日批次作業：新核日下上傳作業
#
# resource
source ./setdailyenv.sh
source ./daily-007-fxdac00-output.sh
source ./daily-007-fxdir00-output.sh
source ./daily-007-fxdir03-output.sh
source ./daily-007-fxdu210-output.sh

source "${BASE_DIR}"/global/bin/parallel.sh

CWD=$(pwd)

# control-M使用到的環境變數
GROUP_NAME="daily-007-gen-files-group"
export GROUP_NAME

# 日上下傳作業-fxdac00
daily_fxdac00_output() {
  echo "daily_fxdac00_output start ${@}"

  fxdac00_main "${@}"

  local status=${?}
  echo "daily_fxdac00_output result code:${status}"
  check_status_and_exit ${status}
}

# 日上下傳作業-fxdir00
daily_fxdir00_output() {
  echo "daily_fxdir00_output start ${@}"

  fxdir00_main "${@}"

  local status=${?}
  echo "daily_fxdir00_output result code:${status}"
  check_status_and_exit ${status}
}

# 日上下傳作業-fxdu210
daily_fxdu210_output() {
  echo "daily_fxdu210_output start ${@}"

  fxdu210_main "${@}"

  local status=${?}
  echo "daily_fxdu210_output result code:${status}"
  check_status_and_exit ${status}
}

# 日上下傳作業-fxdir03
daily_fxdir03_output() {
  echo "daily_fxdir03_output start ${@}"

  fxdir03_main "${@}"

  local status=${?}
  echo "daily_fxdir03_output result code:${status}"
  check_status_and_exit ${status}
}

daily_sequential_run() {
  daily_fxdac00_output
  daily_fxdir00_output
  daily_fxdu210_output
  daily_fxdir03_output
}

daily_parallel_run() {
  clear_parallel_jobs
  parallel daily_fxdac00_output
  parallel daily_fxdir00_output
  parallel daily_fxdu210_output
  parallel daily_fxdir03_output

  wait_and_check_parallel
  local status=${?}
  echo "daily_007 parallel result code:${status}"
  check_status_and_exit ${status}
}

group_main() {
  # Control-M指定重跑
  if [ $# -eq 0 ]; then

    daily_parallel_run

  else
    case "${1}" in
    "1" | "daily_fxdac00_output")
      daily_fxdac00_output ${2}
      ;;
    "2" | "daily_fxdir00_output")
      daily_fxdir00_output ${2}
      ;;
    "3" | "daily_fxdu210_output")
      daily_fxdu210_output ${2}
      ;;
    "4" | "daily_fxdir03_output")
      daily_fxdir03_output ${2}
      ;;
    *)
      echo "unknown: '${1}' "
      exit 1
      ;;
    esac
  fi
}
# 增加SIGINT信號，觸發時將終止程序
trap 'kill 0' SIGINT
group_main "${@}"
