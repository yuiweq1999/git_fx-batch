#!/bin/bash
# 每月批次作業：月作業-下傳舊核 FXM0501
#
# ==============

# resource
# ==============
source ./setmonthlyenv.sh
STEP_DIR='.'

# control-M使用到的環境變數
JOB_NAME="monthly-002-fxm0501-output"
export JOB_NAME
# ==============

# 產出匯出匯入實績資料
# 檔案： xxxx
# ==============
xxxx_output() {
    echo "xxxx_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/xxxx
    "${STEP_DIR}"/monthly-002-fxm0501-job.sh "????"
    status=${?}
    echo "xxxx_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行fxm0501
# ==============
fxm0501_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        xxxx_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "xxxx_output")
            xxxx_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# xxxx_output
# fxm0501_main "${@}"

# ==============
