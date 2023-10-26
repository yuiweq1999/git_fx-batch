#!/bin/bash
# 每月批次作業：月作業-下傳舊核 FXM0501
#
# ==============

# resource
# ==============
source ./setmonthlyenv.sh
STEP_DIR='.'

# control-M使用到的環境變數
JOB_NAME="monthly-002-fxm5320-report"
export JOB_NAME
# ==============

# 產生DECTFC匯出 / 入涉及高風險國家暨疑似第三方明細 ，DECTFA匯出 / 入涉及高風險國家暨疑似第三方統計表
# 報表： DECTFC
# ==============
dectfc_report() {
    echo "dectfc_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/DECTFC
    "${STEP_DIR}"/monthly-002-fxm5320-job.sh "????"
    status=${?}
    echo "dectfc_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生DECTFC匯出 / 入涉及高風險國家暨疑似第三方明細 ，DECTFA匯出 / 入涉及高風險國家暨疑似第三方統計表
# 報表： DECTFA
# ==============
dectfa_report() {
    echo "dectfa_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/DECTFA
    "${STEP_DIR}"/monthly-002-fxm5320-job.sh "????"
    status=${?}
    echo "dectfa_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行fxm5320
# ==============
fxm5320_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        dectfc_report
        dectfa_report
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "dectfc_report")
            dectfc_report
            ;;
        "2" | "dectfa_report")
            dectfa_report
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# dectfc_report
# fxm5320_main "${@}"

# ==============
