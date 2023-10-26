#!/bin/bash
# 每月批次作業：月報表 FXMIR01
#
# ==============

# resource
# ==============
source ./setmonthlyenv.sh
STEP_DIR='.'

# control-M使用到的環境變數
JOB_NAME="monthly-003-fxmir01-report"
export JOB_NAME
# ==============

# 費用求償銷帳檔清檔，國外匯入匯款求償費用剔除明細表(FS64A,FS64B)
# 報表： FS64A
# ==============
fs64a_output() {
    echo "fs64a_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS64A
    "${STEP_DIR}"/monthly-003-fxmir01-job.sh "????"
    status=${?}
    echo "fs64a_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 費用求償銷帳檔清檔，國外匯入匯款求償費用剔除明細表(FS64A,FS64B)
# 報表： FS64B
# ==============
fs64b_output() {
    echo "fs64b_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/FS64B
    "${STEP_DIR}"/monthly-003-fxmir01-job.sh "????"
    status=${?}
    echo "fs64b_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============


# 執行fxmir00報表
# ==============
fxmir01_report_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        fs64a_output
        fs64b_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "fs64a_output")
            fs64a_output
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
fxmir00_report_main "${@}"

# ==============
