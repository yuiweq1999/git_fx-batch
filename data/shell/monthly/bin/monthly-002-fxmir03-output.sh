#!/bin/bash
# 每月批次作業：月作業-下傳舊核 FXMIR03
#
# ==============

# resource
# ==============
source ./setmonthlyenv.sh
STEP_DIR='.'

# control-M使用到的環境變數
JOB_NAME="monthly-002-fxmir03-output"
export JOB_NAME
# ==============

# 產生匯入每月央媒申報檔
# 檔案： VBAG.FX.S.OBU.IR.CENTRAL.DATA
# ==============
s_obu_ir_central_data_output() {
    echo "s_obu_ir_central_data_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAG.FX.S.OBU.IR.CENTRAL.DATA
    "${STEP_DIR}"/monthly-002-fxmir03-job.sh "????"
    status=${?}
    echo "s_obu_ir_central_data_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入每月央媒申報檔
# 檔案： VBAG.FX.S.DBU.IR.CENTRAL.DATA
# ==============
s_dbu_ir_central_data_output() {
    echo "s_dbu_ir_central_data_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAG.FX.S.DBU.IR.CENTRAL.DATA
    "${STEP_DIR}"/monthly-002-fxmir03-job.sh "????"
    status=${?}
    echo "s_dbu_ir_central_data_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行fxmir03
# ==============
fxmir03_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        s_obu_ir_central_data_output
        s_dbu_ir_central_data_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "s_obu_ir_central_data_output")
            s_obu_ir_central_data_output
            ;;
        "2" | "s_dbu_ir_central_data_output")
            s_dbu_ir_central_data_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# s_dbu_ir_central_data_output
# fxmir03_main "${@}"

# ==============
