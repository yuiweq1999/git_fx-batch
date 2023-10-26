#!/bin/bash
# 每日批次作業：接收舊核資料檔處理作業-接收檔案
# 
# ==============

# resource
# ==============
source ./setdailyenv.sh
STEP_DIR='.'

# control-M使用到的環境變數
JOB_NAME="daily-001-ac-files-input"
export JOB_NAME
# ==============

# 從sftp接收舊核資料檔
# ==============
fxtrn_input() {
    echo "fxtrn_input start ${@}"
    export INPUT_FILE="$INPUT_DIR"/VBAR.FX.K.LINE.FXTRN
    "${STEP_DIR}"/daily-001-accounting-job.sh "inputUseCaseImpl"
    local status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}

bu00_input() {
    echo "bu00_input start ${@}"
    export INPUT_FILE="$INPUT_DIR"/VBAR.FX.K.LINE.SUM.BU00
    "${STEP_DIR}"/daily-001-accounting-job.sh "inputUseCaseImpl"
    local status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}

mast_input() {
    echo "mast_input start ${@}"
    export INPUT_FILE="$INPUT_DIR"/VBAR.FX.K.FX.RATE.MAST
    "${STEP_DIR}"/daily-001-accounting-job.sh "inputUseCaseImpl"
    local status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}

prno2_input() {
    echo "prno2_input start ${@}"
    export INPUT_FILE="$INPUT_DIR"/VBA6.FX.K.OUTREMIT.PRNO2
    "${STEP_DIR}"/daily-001-accounting-job.sh "inputUseCaseImpl"
    local status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}

acct_input() {
    echo "acct_sftp start ${@}"
    export INPUT_FILE="$INPUT_DIR"/VBA3.FX.K.OR.CHEAT.ACCT
    "${STEP_DIR}"/daily-001-accounting-job.sh "inputUseCaseImpl"
    local status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}

post_input() {
    echo "post_input start ${@}"
    export INPUT_FILE="$INPUT_DIR"/VBA3.FX.K.POST
    "${STEP_DIR}"/daily-001-accounting-job.sh "inputUseCaseImpl"
    local status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}

olrt_input() {
    echo "post_input start ${@}"
    export INPUT_FILE="$INPUT_DIR"/VAG0.AD.K.OLRT
    "${STEP_DIR}"/daily-001-accounting-job.sh "inputUseCaseImpl"
    local status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}



# ==============

# 執行sftp連線
# ==============
ac_input_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        fxtrn_input
        bu00_input
        mast_input
        prno2_input
        acct_input
        post_input
        olrt_input
    else
        # 指定參數重跑
        case "${1}" in
        "1")
            fxtrn_input
            ;;
        "2")
            bu00_input
            ;;
        "3")
            mast_input
            ;;
        "4")
            prno2_input
            ;;
        "5")
            acct_input
            ;;        
        "6")
            post_input
            ;;
        "7")
            olrt_input
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

# ==============