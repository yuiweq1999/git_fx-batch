#!/bin/bash
# 每週批次作業：週報表作業 FXWIR00
# 
# ==============

# resource
# ==============
source ./setweeklyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="weekly-003-fxwir00-report"
export JOB_NAME

# ==============

# 產生FS80國外匯入匯款待處理案件追蹤表
# 報表： FS80
# ==============
fs80_report() {
    echo "fs80_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS80
    "${STEP_DIR}"/weekly-002-fxwir00-job.sh "????"
    status=${?}
    echo "fs80_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============



# 執行fxwir00週報表
# ==============
fxwir00_report_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        fs80_report
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "fs80_report")
            fs80_report
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# fxwir00_report_main "${@}"

# ==============