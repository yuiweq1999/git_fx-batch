#!/bin/bash
# 每日批次作業：日上下傳作業 FXDAC00
# 
# ==============

# resource
# ==============
source ./setdailyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="daily-007-fxdac00-output"
export JOB_NAME

# ==============

# 挑選匯入歷史資料並FTP下傳至企網  
# 檔案： VBAN.FX.S.IR.EBANK.ER5001
# ==============
s_ir_ebank_er5001_output() {
    echo "s_ir_ebank_er5001_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAN.FX.S.IR.EBANK.ER5001
    "${STEP_DIR}"/daily-007-fxdac00-job.sh "????"
    status=${?}
    echo "s_ir_ebank_er5001_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行日上下傳
# ==============
fxdac00_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        s_ir_ebank_er5001_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "s_ir_ebank_er5001_output")
            s_ir_ebank_er5001_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# fxdac00_main "${@}"

# ==============