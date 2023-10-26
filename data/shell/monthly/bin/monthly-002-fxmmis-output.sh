#!/bin/bash
# 每月批次作業：月作業-下傳舊核 FXMMIS
# 
# ==============

# resource
# ==============
source ./setmonthlyenv.sh
STEP_DIR='.'

# control-M使用到的環境變數
JOB_NAME="monthly-002-fxmmis-output"
export JOB_NAME
# ==============

# 產生MIS月損益資料檔
# 檔案： xxxx
# ==============
xxxx_output() {
    echo "xxxx_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/xxxx
    "${STEP_DIR}"/monthly-002-fxmmis-job.sh "????"
    status=${?}
    echo "xxxx_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款 MIS 月損益資料檔
# 檔案： VMI0.MIS.S.IR.GOL.DW
# ==============
s_ir_gol_dw_output() {
    echo "s_ir_gol_dw_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VMI0.MIS.S.IR.GOL.DW
    "${STEP_DIR}"/monthly-002-fxmmis-job.sh "????"
    status=${?}
    echo "s_ir_gol_dw_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款
# 檔案： VMI0.MIS.S.IR.LOG.DW
# ==============
s_ir_log_dw_output() {
    echo "s_ir_log_dw_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VMI0.MIS.S.IR.LOG.DW
    "${STEP_DIR}"/monthly-002-fxmmis-job.sh "????"
    status=${?}
    echo "s_ir_log_dw_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行fxmmis
# ==============
fxmmis_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        xxxx_output
        s_ir_gol_dw_output
        s_ir_log_dw_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "xxxx_output")
            xxxx_output
            ;;
        "2" | "s_ir_gol_dw_output")
            s_ir_gol_dw_output
            ;;
        "3" | "s_ir_log_dw_output")
            s_ir_log_dw_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# s_ir_gol_dw_output
# fxmmis_main "${@}"

# ==============