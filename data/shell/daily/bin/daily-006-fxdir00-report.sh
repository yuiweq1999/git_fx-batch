#!/bin/bash
# 每日批次作業：日報表作業 FXDIR00
# 
# ==============

# resource
# ==============
source ./setdailyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="daily-006-fxdir00-report"
export JOB_NAME

# ==============

# 產生FS70國外匯入匯款收件明細表 
# 報表： FS70
# ==============
fs70_report() {
    echo "fs70_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS70
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs70_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS72匯入匯款主檔餘額核對表
# 報表： FS72
# ==============
fs72_report() {
    echo "fs72_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS72
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs72_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS77國外匯入匯款營業單位受通知明細表
# 報表： FS77
# ==============
fs77_report() {
    echo "fs77_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS77
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs77_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS73國外匯入匯款營業單位受通知明細表
# 報表： FS73
# ==============
fs73_report() {
    echo "fs73_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS73
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs73_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS74國外匯入匯款營業單位受通知明細表
# 報表： FS74
# ==============
fs74_report() {
    echo "fs74_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS74
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs74_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FE10A國外費用及利息申報表
# 報表： FE10A
# ==============
fe10a_report() {
    echo "fe10a_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FE10A
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fe10a_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS75,FS75B國外匯入匯款全行結帳表
# 報表： FS75
# ==============
fs75_report() {
    echo "fs75_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS75
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs75_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS75,FS75B國外匯入匯款全行結帳表
# 報表： FS75B
# ==============
fs75b_report() {
    echo "fs75b_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS75B
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs75b_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS76,FS76A,FS76B國外匯入匯款通知明細表
# 報表： FS76
# ==============
fs76_report() {
    echo "fs76_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS76
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs76_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS76,FS76A,FS76B國外匯入匯款通知明細表
# 報表： FS76A
# ==============
fs76a_report() {
    echo "fs76a_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS75A
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs76a_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS76,FS76A,FS76B國外匯入匯款通知明細表
# 報表： FS76B
# ==============
fs76b_report() {
    echo "fs76b_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS75B
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs76b_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS92列印自動放行電文稿
# 報表： FS92
# ==============
fs92_report() {
    echo "fs92_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS92
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs92_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS78H國外匯入匯款七日表
# 報表： FS78H
# ==============
fs78h_report() {
    echo "fs78h_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS78H
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs78h_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS79國外匯入主檔異動表
# 報表： FS79
# ==============
fs79_report() {
    echo "fs79_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS79
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs79_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS62A，FS62B，FS67 列印銷帳檔未入帳明細表
# 報表： FS62A
# ==============
fs62a_report() {
    echo "fs62a_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS62A
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs62a_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS62A，FS62B，FS67 列印銷帳檔未入帳明細表
# 報表： FS62B
# ==============
fs62b_report() {
    echo "fs62b_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS62B
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs62b_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS62A，FS62B，FS67 列印銷帳檔未入帳明細表
# 報表： FS67
# ==============
fs67_report() {
    echo "fs67_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS67
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs67_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款即遠期換匯交易 (SWAP) 明細，印製 <FZ06B>即期外匯尚未交割科目餘額表
# 報表： FZ06B
# ==============
fz06b_report() {
    echo "fz06b_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FZ06B
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fz06b_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生 <FZ07B> 即期未交割餘額核對表及即期外匯尚未交割科目餘額表
# 報表： FZ07B
# ==============
fz07b_report() {
    echo "fz07b_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FZ07B
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fz07b_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS76C OBU聯行間匯款結帳後未入帳明細表
# 報表： FS76C
# ==============
fs76c_report() {
    echo "fs76c_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS76C
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs76c_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生當日匯入匯款交易憑證
# 報表： FS65A
# ==============
fs65a_report() {
    echo "fs65a_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS65A
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs65a_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生當日匯入匯款交易憑證
# 報表： FS65E01
# ==============
fs65e01_report() {
    echo "fs65e01_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS65E01
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs65e01_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生當日匯入匯款交易憑證
# 報表： FS65E02
# ==============
fs65e02_report() {
    echo "fs65e02_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS65E02
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs65e02_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生當日匯入匯款交易憑證
# 報表： FS65E03
# ==============
fs65e03_report() {
    echo "fs65e03_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS65E03
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs65e03_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生當日匯入匯款交易憑證
# 報表： FS65B
# ==============
fs65b_report() {
    echo "fs65b_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS65B
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs65b_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS69A,FS69B網路銀行匯入匯款交易明細表
# 報表： FS69A
# ==============
fs69a_report() {
    echo "fs69a_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS69A
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs69a_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS69A,FS69B網路銀行匯入匯款交易明細表
# 報表： FS69B
# ==============
fs69b_report() {
    echo "fs69b_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS69B
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs69b_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生 FS95 國外匯入匯款大額交易控管表 
# 報表： FS95
# ==============
fs95_report() {
    echo "fs95_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS95
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs95_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS98A,FS98B國外匯入匯款徵取切結書案件明細表
# 報表： FS98A
# ==============
fs98a_report() {
    echo "fs98a_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS98A
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs98a_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS98A,FS98B國外匯入匯款徵取切結書案件明細表
# 報表： FS98B
# ==============
fs98b_report() {
    echo "fs98b_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS98B
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs98b_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS66A,FS66B,FS68向國外求償差額明細表
# 報表： FS66A
# ==============
fs66a_report() {
    echo "fs66a_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS66A
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs66a_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS66A,FS66B,FS68向國外求償差額明細表
# 報表： FS66B
# ==============
fs66b_report() {
    echo "fs66b_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS66B
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs66b_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS66A,FS66B,FS68向國外求償差額明細表
# 報表： FS68
# ==============
fs68_report() {
    echo "fs68_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS68
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs68_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS95系列國外匯入疑似化整為零案件日報表
# 報表： FS95D
# ==============
fs95d_report() {
    echo "fs95d_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS95D
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs95d_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# OUR銷帳檔作業並產生FS61A,FS61B報表
# 報表： FS61A
# ==============
fs61a_report() {
    echo "fs61a_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS61A
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs61a_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# OUR銷帳檔作業並產生FS61A,FS61B報表
# 報表： FS61B
# ==============
fs61b_report() {
    echo "fs61b_report start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS61B
    "${STEP_DIR}"/daily-006-fxdir00-report-job.sh "????"
    status=${?}
    echo "fs61b_report result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行日報表
# ==============
fxdir00_report_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        fs70_report
        fs72_report
        fs77_report
        fs73_report
        fs74_report
        fe10a_report
        fs75_report
        fs75b_report
        fs76_report
        fs76a_report
        fs76b_report
        fs92_report
        fs78h_report
        fs79_report
        fs62a_report
        fs62b_report
        fs67_report
        fz06b_report
        fz07b_report
        fs76c_report
        fs65a_report
        fs65e01_report
        fs65e02_report
        fs65e03_report
        fs65b_report
        fs69a_report
        fs69b_report
        fs95_report
        fs98a_report
        fs98b_report
        fs66a_report
        fs66b_report
        fs68_report
        fs95d_report
        fs61a_report
        fs61b_report
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "fs70_report")
            fs70_report
            ;;
        "2" | "fs72_report")
            fs72_report
            ;;
        "3" | "fs77_report")
            fs77_report
            ;;
        "4" | "fs73_report")
            fs73_report
            ;;
        "5" | "fs74_report")
            fs74_report
            ;;
        "6" | "fe10a_report")
            fe10a_report
            ;;
        "7" | "fs75_report")
            fs75_report
            ;;
        "8" | "fs75b_report")
            fs75b_report
            ;;
        "9" | "fs76_report")
            fs76_report
            ;;
        "10" | "fs76a_report")
            fs76a_report
            ;;
        "11" | "fs76b_report")
            fs76b_report
            ;;
        "12" | "fs92_report")
            fs92_report
            ;;
        "13" | "fs78h_report")
            fs78h_report
            ;;
        "14" | "fs79_report")
            fs79_report
            ;;
        "15" | "fs62a_report")
            fs62a_report
            ;;
        "16" | "fs62b_report")
            fs62b_report
            ;;
        "17" | "fs67_report")
            fs67_report
            ;;
        "18" | "fz06b_report")
            fz06b_report
            ;;
        "19" | "fz07b_report")
            fz07b_report
            ;;
        "20" | "fs76c_report")
            fs76c_report
            ;;
        "21" | "fs65a_report")
            fs65a_report
            ;;
        "22" | "fs65e01_report")
            fs65e01_report
            ;;
        "23" | "fs65e02_report")
            fs65e02_report
            ;;
        "24" | "fs65e03_report")
            fs65e03_report
            ;;
        "25" | "fs65b_report")
            fs65b_report
            ;;
        "26" | "fs69a_report")
            fs69a_report
            ;;
        "27" | "fs69b_report")
            fs69b_report
            ;;
        "28" | "fs95_report")
            fs95_report
            ;;
        "29" | "fs98a_report")
            fs98a_report
            ;;
        "30" | "fs98b_report")
            fs98b_report
            ;;
        "31" | "fs66a_report")
            fs66a_report
            ;;
        "32" | "fs66b_report")
            fs66b_report
            ;;
        "33" | "fs68_report")
            fs68_report
            ;;
        "34" | "fs95d_report")
            fs95d_report
            ;;
        "35" | "fs61a_report")
            fs61a_report
            ;;
        "36" | "fs61b_report")
            fs61b_report
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
fxdir00_report_main "${@}"

# ==============