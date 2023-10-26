#!/bin/bash
# 每日批次作業：日上下傳作業 FXDIR03
#
# ==============

# resource
# ==============
source ./setdailyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="daily-007-fxdir00-report"
export JOB_NAME

# ==============

# 匯入信託匯入帳號設定檔
# 報表： xxxxx
# ==============
s_ir_dw_irmark_output() {
    echo "s_ir_dw_irmark_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/xxxxx
    "${STEP_DIR}"/daily-007-fxdir03-job.sh "????"
    status=${?}
    echo "s_ir_dw_irmark_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行日上下傳
# ==============
fxdir03_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        s_ir_dw_irmark_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "s_ir_dw_irmark_output")
            s_ir_dw_irmark_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# fxdir03_main "${@}"

# ==============
