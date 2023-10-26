#!/bin/bash
# 每日批次作業：日作業-月底下傳舊核(會計) FXDG300
# 
# resource
source ./setdailyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="daily-004-month-fxdg300-output"
export JOB_NAME

# 產生匯入DO案件資料檔
# 檔案： VBAM.FX.S.IR.DO.DATA
s_ir_do_data_output() {
    echo "s_ir_do_data_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAM.FX.S.IR.DO.DATA
    "${STEP_DIR}"/daily-004-month-fxdg300-job.sh "????"
    status=${?}
    echo "s_ir_do_data_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

fxdg300_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then 
        s_ir_do_data_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "s_ir_do_data_output")
            s_ir_do_data_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
fxdg300_main