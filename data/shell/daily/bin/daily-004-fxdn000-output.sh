#!/bin/bash
# 每日批次作業：日作業-下傳舊核(會計) FXDN000
# 
# resource
source ./setdailyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="daily-004-fxdn000-output"
export JOB_NAME

# 產生匯入DECTA資料檔
# 檔案： VBAP.FX.S.DECTA.IR
s_decta_ir_output() {
    echo "s_decta_ir_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAP.FX.S.DECTA.IR
    "${STEP_DIR}"/daily-004-fxdn000-job.sh "????"
    status=${?}
    echo "s_decta_ir_output result code:${status}"
    check_status_and_exit ${status}
}




# ==============

fxdn000_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        
        s_decta_ir_output
        
        
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "s_decta_ir_output")
            s_decta_ir_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# fxdn000_main