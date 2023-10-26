#!/bin/bash
# 每日批次作業：月底接收舊核資料檔處理作業-接收檔案
# 
# resource
source ./setdailyenv.sh
STEP_DIR='.'

# control-M使用到的環境變數
JOB_NAME="daily-004-month-ac-files-input"
export JOB_NAME

# 從sftp接收舊核資料檔
exrtn_input() {
    echo "fxtrn_input start ${@}"
    export INPUT_FILE="$INPUT_DIR"/VAG0.AD.K.EXRT.N
    "${STEP_DIR}"/daily-004-month-accounting-job "inputUseCaseImpl"
    status=${?}
    echo "result code:${status}"
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