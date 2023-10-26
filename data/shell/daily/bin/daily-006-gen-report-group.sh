#!/bin/bash
# 每日批次作業：新核上傳共用檔作業
# 
# resource
source ./setdailyenv.sh
source ./daily-006-fxdir00-report.sh
source ./daily-006-fxdir00-output.sh
source ./daily-006-fxdir02-report.sh


source "${BASE_DIR}"/global/bin/parallel.sh

CWD=`pwd`

# control-M使用到的環境變數
GROUP_NAME="daily-006-gen-report-group"
export GROUP_NAME


# 日作業報表-fxdir00
daily_fxdir00_report() {
    echo "daily_fxdir00_report start ${@}"

    fxdir00_report_main "${@}"
    
    local status=${?}
    echo "daily_fxdir00_report result code:${status}"
    check_status_and_exit ${status}
}

# 日作業報表-fxdir02
daily_fxdir02_report() {
    echo "daily_fxdir02_report start ${@}"

    fxdir02_report_main "${@}"
    
    local status=${?}
    echo "daily_fxdir02_report result code:${status}"
    check_status_and_exit ${status}
}

# 日作業報表-fxdir00-產生檔案
daily_fxdir00_report_output() {
    echo "daily_fxdir00_report_output start ${@}"

    fxdir00_report_output_main "${@}"
    
    local status=${?}
    echo "daily_fxdir00_report_output result code:${status}"
    check_status_and_exit ${status}
}


daily_sequential_run() {
  daily_fxdir00_report
  daily_fxdir02_report
  daily_fxdir00_report_output
}

daily_parallel_run() {
  clear_parallel_jobs
  parallel daily_fxdir00_report
  parallel daily_fxdir02_report
  parallel daily_fxdir00_report_output
  
  wait_and_check_parallel
  local status=${?}
  echo "daily_006 parallel result code:${status}"
  check_status_and_exit ${status}
}


# 判斷是否為月底日
END_DAY_OF_MONTH=0
is_end_day_of_month() {
  echo "is_end_day_of_month start"
  #TODO 待置入判斷 step
  END_DAY_OF_MONTH=1
  echo "is_end_day_of_month result code:${END_DAY_OF_MONTH}"
}

group_main() {
    # Control-M指定重跑
    if [ $# -eq 0 ]; then

      daily_parallel_run

    else    
      case "${1}" in
      "1" | "daily_fxdir00_report")
          daily_fxdir00_report ${2}
          ;;
      "2" | "daily_fxdir02_report")
          daily_fxdir02_report ${2}
          ;;
      "3" | "daily_fxdir00_report_output")
          daily_fxdir00_output ${2}
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
