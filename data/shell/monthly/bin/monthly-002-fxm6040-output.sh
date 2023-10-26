#!/bin/bash
# 每月批次作業：月作業-下傳舊核 FXM6040
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

# 下傳匯入資料產生FM83A營業單位幣別兌換利益再分配
# 檔案： xxxx
# ==============
xxxx_output() {
    echo "xxxx_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/xxxx
    "${STEP_DIR}"/monthly-002-fxm6040-job.sh "????"
    status=${?}
    echo "xxxx_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 挑選兩岸金融業務 
# 檔案： ????
# ==============
xxxxxx_output() {
    echo "xxxxxx_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/????
    "${STEP_DIR}"/monthly-002-fxm6040-job.sh "????"
    status=${?}
    echo "xxxxxx_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行fxm0501
# ==============
fxm6040_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        xxxx_output
        xxxxxx_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "xxxx_output")
            xxxx_output
            ;;
        "2" | "xxxxxx_output")
            xxxxxx_output
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
# fxm6040_main "${@}"

# ==============
