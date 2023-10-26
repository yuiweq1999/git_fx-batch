#!/bin/bash
# 每日批次作業：日上下傳作業 FXDU210
#
# ==============

# resource
# ==============
source ./setdailyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="daily-007-fxdu210-output"
export JOB_NAME

# ==============

# 產生當日(DBU/OBU)匯入匯款處理記錄單(產生FS65C,FS65D)
# 檔案： VBAP.FX.S.IR.DBU.NETPRINT.HOLIDAY
# ==============
s_ir_dbu_netprint_holiday_output() {
    echo "s_ir_dbu_netprint_holiday_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAP.FX.S.IR.DBU.NETPRINT.HOLIDAY
    "${STEP_DIR}"/daily-007-fxdu210-job.sh "????"
    status=${?}
    echo "s_ir_dbu_netprint_holiday_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生當日(DBU/OBU)匯入匯款處理記錄單(產生FS65C,FS65D)
# 檔案： VBAP.FX.S.IR.OBU.NETPRINT.HOLIDAY
# ==============
s_ir_obu_netprint_holiday_output() {
    echo "s_ir_obu_netprint_holiday_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAP.FX.S.IR.OBU.NETPRINT.HOLIDAY
    "${STEP_DIR}"/daily-007-fxdu210-job.sh "????"
    status=${?}
    echo "s_ir_obu_netprint_holiday_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行日上下傳
# ==============
fxdu210_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        s_ir_dbu_netprint_holiday_output
        s_ir_obu_netprint_holiday_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "s_ir_dbu_netprint_holiday_output")
            s_ir_dbu_netprint_holiday_output
            ;;
        "2" | "s_ir_obu_netprint_holiday_output")
            s_ir_obu_netprint_holiday_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# fxdu210_main "${@}"

# ==============
