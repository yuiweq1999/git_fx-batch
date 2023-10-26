#!/bin/bash
# 每日批次作業：日作業-下傳舊核(共用) FXDMIS
# 
# resource
source ./setdailyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="daily-005-fxdmis-output"
export JOB_NAME

# 產生匯入匯款每日損益資料檔
# 檔案： VMI0.MIS.S.IR.INT.DAILY
s_ir_int_daily_output() {
    echo "s_ir_int_daily_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VMI0.MIS.S.IR.INT.DAILY
    "${STEP_DIR}"/daily-005-fxdmis-job.sh "????"
    status=${?}
    echo "s_ir_int_daily_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入匯款每日損益資料檔
# 檔案： VMI0.MIS.S.IR.STANDARD.DAILY
s_ir_standard_daily_output() {
    echo "s_ir_standard_daily_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VMI0.MIS.S.IR.STANDARD.DAILY
    "${STEP_DIR}"/daily-005-fxdmis-job.sh "????"
    status=${?}
    echo "s_ir_standard_daily_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入匯款每日損益資料檔
# 檔案： VMI0.MIS.S.IR.AMT.DW
s_ir_amt_dw_output() {
    echo "s_ir_amt_dw_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VMI0.MIS.S.IR.AMT.DW
    "${STEP_DIR}"/daily-005-fxdmis-job.sh "????"
    status=${?}
    echo "s_ir_amt_dw_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入匯款每日損益資料檔
# 檔案： VMI0.MIS.S.IR.EMAIL
s_ir_email_output() {
    echo "s_ir_email_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VMI0.MIS.S.IR.EMAIL
    "${STEP_DIR}"/daily-005-fxdmis-job.sh "????"
    status=${?}
    echo "s_ir_email_output result code:${status}"
    check_status_and_exit ${status}
}

# 將匯入MIS資料MOD進POOL及FX共用檔
# 檔案： VMI0.MIS.S.IR.INT.DAILY.POOL
s_ir_int_daily_pool_output() {
    echo "s_ir_int_daily_pool_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VMI0.MIS.S.IR.INT.DAILY.POOL
    "${STEP_DIR}"/daily-005-fxdmis-job.sh "????"
    status=${?}
    echo "s_ir_int_daily_pool_output result code:${status}"
    check_status_and_exit ${status}
}


# ==============

fxdmis_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        s_ir_int_daily_output
        s_ir_standard_daily_output
        s_ir_amt_dw_output
        s_ir_email_output
        s_ir_int_daily_pool_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "s_ir_int_daily_output")
            s_ir_int_daily_output
            ;;
        "2" | "s_ir_standard_daily_output")
            s_ir_standard_daily_output
            ;;  
        "3" | "s_ir_amt_dw_output")
            s_ir_amt_dw_output
            ;;
        "4" | "s_ir_email_output")
            s_ir_email_output
            ;;
        "5" | "s_ir_int_daily_pool_output")
            s_ir_int_daily_pool_output
            ;;                   
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# fxdmis_main