#!/bin/bash
# 每日批次作業：日作業-下傳舊核(共用) FXDM010
# 
# resource
source ./setdailyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="daily-004-fxdm010-output"
export JOB_NAME

# 網銀匯入資料產出 - 線上解款
# 檔案： VBA7.FX.S.IR.NETBANK.DAY
s_ir_netbank_day_output() {
    echo "s_ir_netbank_day_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBA7.FX.S.IR.NETBANK.DAY
    "${STEP_DIR}"/daily-005-fxdm010-job.sh "????"
    status=${?}
    echo "s_ir_netbank_day_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

fxdm010_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then 
        s_ir_netbank_day_output
        
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "s_ir_netbank_day_output")
            s_ir_netbank_day_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# fxdm010_main