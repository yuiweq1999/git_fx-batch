#!/bin/bash
# 每月批次作業：月報表 FXMIR00
#
# ==============

# resource
# ==============
source ./setmonthlyenv.sh
STEP_DIR='.'

# control-M使用到的環境變數
JOB_NAME="monthly-003-fxmir00-report"
export JOB_NAME
# ==============

# 產生FS87應解匯款科目明細表
# 報表： FS87
# ==============
fs87_output() {
    echo "fs87_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS87
    "${STEP_DIR}"/monthly-005-fxmir00-job.sh "????"
    status=${?}
    echo "fs87_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FM46B DBU辦理大陸人士匯入匯款業務月報表，FM96C,FM96D國外匯款可疑警示案件月報
# 報表： FM46B報表
# ==============
fm46b_output() {
    echo "fm46b_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/xxxx
    "${STEP_DIR}"/monthly-005-fxmir00-job.sh "????"
    status=${?}
    echo "fm46b_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============


# 執行fxmir00報表
# ==============
fxmir00_report_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        fs87_output
        fm46b_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "fs87_output")
            fs87_output
            ;;
        "2" | "fm46b_output")
            fm46b_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# fm46b_output
# fxmir00_report_main "${@}"

# ==============
