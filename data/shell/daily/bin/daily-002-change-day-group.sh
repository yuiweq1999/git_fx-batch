#!/bin/bash
# 每日批次作業：換日作業
# 
# ==============

# resource
# ==============
source ./setdailyenv.sh

CWD=`pwd`

# control-M使用到的環境變數
GROUP_NAME="daily-002-change-day-group"
export GROUP_NAME
# ==============

# 換日作業
# ==============
chang_day() {
    # step1
    # step1專用的input,output
    echo "chang_day start ${@}"
    "${STEP_DIR}"/daily-chang-day-job.sh "createCustomerUseCaseImpl"
    status=${?}
    echo "chang_day result code:${status}"
    check_status_and_exit ${status}
}

# 執行換日作業
# ==============
change_day_group_main() {
    if [ $# -eq 0 ]; then
        chang-day
    else    
      case "${1}" in
      "chang_day")
          chang-day ${2}
          ;; 
      *)
          echo "unknown argument: '${1}' "
          exit 1
          ;;
      esac 
    fi
}
trap 'kill 0' SIGINT
change_day_group_main "${@}"

# ==============