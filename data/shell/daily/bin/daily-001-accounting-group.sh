#!/bin/bash
# 每日批次作業：接收舊核資料檔處理作業
# 
# ==============

# resource
# ==============
source ./setdailyenv.sh
source ./daily-001-ac-files-sftp.sh
source ./daily-001-ac-files-input.sh
# source "$BASE_DIR"/monthly/bin/monthly-ac-files-sftp.sh

# control-M使用到的環境變數
GROUP_NAME="daily-001-accounting-group"
export GROUP_NAME
# ==============


# 連線sftp
# ==============
daily_ac_files_sftp() {
    echo "daily_ac_files_sftp start ${@}"
    
    ac_sftp_main "${@}"
    
    local status=${?}
    echo "daily_ac_files_sftp result code:${status}"
    check_status_and_exit ${status}
}

# 接收檔案
# ==============
daily_ac_files_input() {
    echo "daily_ac_files_input start ${@}"

    ac_input_main "${@}"
    
    local status=${?}
    echo "daily_ac_files_input result code:${status}"
    check_status_and_exit ${status}
}

# 判斷是否為月底日
# ==============
END_DAY_OF_MONTH=0
is_end_day_of_month() {
  echo "is_end_day_of_month start"
  #TODO 待置入判斷 step
  echo "is_end_day_of_month result code:${END_DAY_OF_MONTH}"
}

# 執行group
# ==============
group_main() {
    # Control-M指定重跑
    if [ $# -eq 0 ]; then
      daily_ac_files_sftp
      daily_ac_files_input
      is_end_day_of_month
      if [ ${END_DAY_OF_MONTH} -eq 1 ]; then
        monthly_ac_files_sftp
        monthly_ac_files_input
      fi
    else    
      case "${1}" in
      "daily_sftp")
          daily_ac_files_sftp ${2}
          ;;
      "daily_input")
          daily_ac_files_input ${2}
          ;;
      "monthly_sftp")
          monthly_ac_files_sftp ${2}
          ;;        
      "monthly_input")
          monthly_ac_files_input ${2}
          ;;    
      *)
          echo "unknown argument: '${1}' "
          exit 1
          ;;
      esac 
    fi
}
# 增加SIGINT信號，觸發時將終止程序
trap 'kill 0' SIGINT
group_main "${@}"

# ==============