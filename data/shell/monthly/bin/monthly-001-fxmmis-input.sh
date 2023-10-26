#!/bin/bash
# 每月批次作業：接收舊核資料檔處理作業-接收檔案
# 
# resource
source ./setmonthlyenv.sh
STEP_DIR='.'

# control-M使用到的環境變數
JOB_NAME="monthly-001-fxmmis-input"
export JOB_NAME

# 從sftp接收舊核資料檔
# ==============
loss_input() {
    echo "loss_input start ${@}"
    export INPUT_FILE="$INPUT_DIR"/VMI0.MIS.S.IR.INT.LOSS
    "${STEP_DIR}"/monthly-accounting-job.sh "inputUseCaseImpl"
    status=${?}
    echo "loss_input result code:${status}"
    check_status_and_exit ${status}
}

pool_input() {
    echo "pool_input start ${@}"
    export INPUT_FILE="$INPUT_DIR"/VMI0.MIS.S.UPD.INT.DAILY.POOL
    "${STEP_DIR}"/monthly-accounting-job.sh "inputUseCaseImpl"
    status=${?}
    echo "pool_input result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行sftp連線
ac_input_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        exrtn_input

    else
        # 指定參數重跑
        case "${1}" in
        "1")
            exrtn_input
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試單一step與ac_input_main
# fxtrn_input
# ac_input_main