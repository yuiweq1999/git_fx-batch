#!/bin/bash
# 每日批次作業：日報表作業 FXDIR02
# 
# ==============

# resource
# ==============
source ./setdailyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="daily-006-fxdir02-report"
export JOB_NAME

# ==============

# 產生OUR求償電文FS60A,FS60B,FS61A,FS61B,FS62A,FS62B
# 報表： FS60A
# ==============
fs60a_report() {
    echo "fs60a_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS60A
    "${STEP_DIR}"/daily-006-fxdir02-report-job.sh "????"
    status=${?}
    echo "fs60a_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生OUR求償電文FS60A,FS60B,FS61A,FS61B,FS62A,FS62B
# 報表： FS60B
# ==============
fs60b_report() {
    echo "fs60b_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS60B
    "${STEP_DIR}"/daily-006-fxdir02-report-job.sh "????"
    status=${?}
    echo "fs60b_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生OUR求償電文FS60A,FS60B,FS61A,FS61B,FS62A,FS62B
# 報表： FS61A
# ==============
fs61a_report() {
    echo "fs61a_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS61A
    "${STEP_DIR}"/daily-006-fxdir02-report-job.sh "????"
    status=${?}
    echo "fs61a_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生OUR求償電文FS60A,FS60B,FS61A,FS61B,FS62A,FS62B
# 報表： FS61B
# ==============
fs61b_report() {
    echo "fs61b_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS61b
    "${STEP_DIR}"/daily-006-fxdir02-report-job.sh "????"
    status=${?}
    echo "fs61b_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生OUR求償電文FS60A,FS60B,FS61A,FS61B,FS62A,FS62B
# 報表： FS62A
# ==============
fs62a_report() {
    echo "fs62a_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS62A
    "${STEP_DIR}"/daily-006-fxdir02-report-job.sh "????"
    status=${?}
    echo "fs62a_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生OUR求償電文FS60A,FS60B,FS61A,FS61B,FS62A,FS62B
# 報表： FS62B
# ==============
fs62b_report() {
    echo "fs62b_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS62B
    "${STEP_DIR}"/daily-006-fxdir02-report-job.sh "????"
    status=${?}
    echo "fs62b_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============


# 執行fxdir02日報表
# ==============
fxdir02_report_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        fs60a_report
        fs60b_report
        fs61a_report
        fs61b_report
        fs62a_report
        fs62b_report
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "fs60a_report")
            fs60a_report
            ;;
        "2" | "fs60b_report")
            fs60b_report
            ;;
        "3" | "fs61a_report")
            fs61a_report
            ;;
        "4" | "fs61b_report")
            fs61b_report
            ;;
        "5" | "fs62a_report")
            fs62a_report
            ;;
        "6" | "fs62b_report")
            fs62b_report
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# fxdir02_report_main "${@}"

# ==============