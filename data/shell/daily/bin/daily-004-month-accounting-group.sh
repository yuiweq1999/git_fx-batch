#!/bin/bash
# 每日批次作業：月底接收舊核資料檔處理作業
# ※這個group不確定會不會用到，因為已經被daily跨週期呼叫執行
# ==============

# resource
# ==============
source ./setdailyenv.sh
source ./daily-004-month-ac-files-input.sh
source ./daily-004-month-ac-files-sftp.sh

# control-M使用到的環境變數
GROUP_NAME="daily-004-month-accounting-group"
export GROUP_NAME
# ==============


# 連線sftp
# ==============
monthly_ac_files_sftp() {
    echo "monthly_ac_files_sftp start ${@}"
    
    ac_sftp_main "${@}"
    
    local status=${?}
    echo "monthly_ac_files_sftp result code:${status}"
    check_status_and_exit ${status}
}

# 接收檔案
# ==============
monthly_ac_files_input() {
    echo "monthly_ac_files_input start ${@}"

    ac_input_main "${@}"
    
    local status=${?}
    echo "monthly_ac_files_input result code:${status}"
    check_status_and_exit ${status}
}

# 執行group
# ==============
group_main() {
    # Control-M指定重跑
    if [ $# -eq 0 ]; then
      monthly_ac_files_sftp
      monthly_ac_files_input
    else    
      case "${1}" in
      "1" | "monthly_ac_files_sftp")
          monthly_ac_files_sftp ${2}
          ;;
      "2" | "monthly_ac_files_input")
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