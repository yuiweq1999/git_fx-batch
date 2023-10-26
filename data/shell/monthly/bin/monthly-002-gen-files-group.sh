#!/bin/bash
# 每月批次作業：新核上傳共用檔作業
# 
# resource
source ./setmonthlyenv.sh
source ./monthly-002-fxmmis-output.sh
source ./monthly-002-fxmir00-output.sh
source ./monthly-002-fxmir03-output.sh
source ./monthly-002-fxmg000-output.sh
source ./monthly-002-fxm0501-output.sh
source ./monthly-002-fxm5320-report.sh
source ./monthly-002-fxm6040-output.sh
source ./monthly-002-fxm6140-output.sh



source "${BASE_DIR}"/global/bin/parallel.sh

CWD=`pwd`

# control-M使用到的環境變數
GROUP_NAME="monthly-002-gen-files-group"
export GROUP_NAME


# 月作業-fxmmis
monthly_fxmmis_output() {
    echo "monthly_fxmmis_output start ${@}"

    fxmmis_main "${@}"
    
    local status=${?}
    echo "monthly_fxmmis_output result code:${status}"
    check_status_and_exit ${status}
}

# 月作業-fxmir00
monthly_fxmir00_output() {
    echo "monthly_fxmir00_report start ${@}"

    fxmir00_main "${@}"
    
    local status=${?}
    echo "monthly_fxmir00_report result code:${status}"
    check_status_and_exit ${status}
}

# 月作業-fxmg000
monthly_fxmg000_output() {
    echo "monthly_fxmg000_report start ${@}"

    fxmg000_main "${@}"
    
    local status=${?}
    echo "monthly_fxmg000_report result code:${status}"
    check_status_and_exit ${status}
}

# 月作業-fxmg0501
monthly_fxmg0501_output() {
    echo "monthly_fxmg0501_output start ${@}"

    fxm0501_main "${@}"
    
    local status=${?}
    echo "monthly_fxmg0501_output result code:${status}"
    check_status_and_exit ${status}
}

# 月作業-fxmg5320
monthly_fxmg5320_report() {
    echo "monthly_fxmg5320_report start ${@}"

    fxm5320_main "${@}"
    
    local status=${?}
    echo "monthly_fxmg5320_report result code:${status}"
    check_status_and_exit ${status}
}

# 月作業-fxmg6040
monthly_fxmg6040_output() {
    echo "monthly_fxmg6040_report start ${@}"

    fxm6040_main "${@}"
    
    local status=${?}
    echo "monthly_fxmg6040_report result code:${status}"
    check_status_and_exit ${status}
}

# 月作業-fxmg6140
monthly_fxmg6140_output() {
    echo "monthly_fxmg6140_report start ${@}"

    fxm6140_main "${@}"
    
    local status=${?}
    echo "monthly_fxmg6140_report result code:${status}"
    check_status_and_exit ${status}
}


monthly_sequential_run() {
  monthly_fxmmis_output
  monthly_fxmir00_output
  monthly_fxmg000_output
  monthly_fxmg0501_output
  monthly_fxmg5320_report
  monthly_fxmg6040_output
  monthly_fxmg6140_output
}

monthly_parallel_run() {
  clear_parallel_jobs
  parallel monthly_fxmmis_output
  parallel monthly_fxmir00_output
  parallel monthly_fxmg000_output
  parallel monthly_fxmg0501_output
  parallel monthly_fxmg5320_report
  parallel monthly_fxmg6040_output
  parallel monthly_fxmg6140_output
  
  wait_and_check_parallel
  local status=${?}
  echo "monthly_002 parallel result code:${status}"
  check_status_and_exit ${status}
}

group_main() {
    # Control-M指定重跑
    if [ $# -eq 0 ]; then

      monthly_parallel_run

    else    
      case "${1}" in
      "1" | "monthly_fxmmis_output")
          monthly_fxmmis_output ${2}
          ;;
      "2" | "monthly_fxmir00_output")
          monthly_fxmir00_output ${2}
          ;;
      "3" | "monthly_fxmg000_output")
          monthly_fxmg000_output ${2}
          ;;
      "4" | "monthly_fxmg0501_output")
          monthly_fxmg0501_output ${2}
          ;; 
      "5" | "monthly_fxmg5320_report")
          monthly_fxmg5320_report ${2}
          ;; 
      "6" | "monthly_fxmg6040_output")
          monthly_fxmg6040_output ${2}
          ;; 
      "7" | "monthly_fxmg6140_output")
          monthly_fxmg6140_output ${2}
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
