#!/bin/bash
# 每週批次作業：新核週作業
# 
# resource
source ./setweeklyenv.sh
source ./weekly-001-fxwir00-output.sh

source "${BASE_DIR}"/global/bin/parallel.sh

CWD=`pwd`

# control-M使用到的環境變數
GROUP_NAME="weekly-001-gen-files-group"
export GROUP_NAME


# 週作業-fxwir00
weekly_fxwir00_output() {
    echo "weekly_fxwir00_output start ${@}"

    fxwir00_main "${@}"
    
    local status=${?}
    echo "weekly_fxwir00_output result code:${status}"
    check_status_and_exit ${status}
}

# 週作業-fxwir00連線sftp
weekly_fxwir00_sftp() {
    echo "weekly_fxwir00_sftp start ${@}"

    fxwir00_sftp_main "${@}"
    
    local status=${?}
    echo "weekly_fxwir00_sftp result code:${status}"
    check_status_and_exit ${status}
}


weekly_sequential_run() {
  weekly_fxwir00_output
  weekly_fxwir00_sftp

}
weekly_parallel_run() {
  clear_parallel_jobs
  parallel weekly_fxwir00_output
  parallel weekly_fxwir00_sftp
  
  wait_and_check_parallel
  local status=${?}
  echo "weekly_001 parallel result code:${status}"
  check_status_and_exit ${status}
}

group_main() {
    # Control-M指定重跑
    if [ $# -eq 0 ]; then

     weekly_parallel_run

    else    
      case "${1}" in
      "1" | "weekly_fxwir00_output")
          weekly_fxwir00_output ${2}
          ;;
      "2" | "weekly_fxwir00_sftp")
          weekly_fxwir00_sftp ${2}
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
