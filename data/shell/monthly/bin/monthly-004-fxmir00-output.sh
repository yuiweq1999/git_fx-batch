#!/bin/bash
# 月批次作業：新核月檔案上下傳 FXMIR00
# 
# resource
source "${BASE_DIR}"/monthly/bin/setmonthlyenv.sh
MONTHLY_STEP_DIR="${BASE_DIR}"/monthly/bin

# 環境變數
JOB_NAME="monthly-004-fxmir00-output"
export JOB_NAME

# 產生人民幣匯入匯款月交易資料
# 檔案： VBAM.FX.S.IR.TWD
s_ir_do_data_output() {
    echo "s_ir_do_data_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAM.FX.S.IR.DO.DATA
    "${MONTHLY_STEP_DIR}"/monthly-004-fxdg300-job.sh "????"
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
        "1")
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
# fxdg300_main