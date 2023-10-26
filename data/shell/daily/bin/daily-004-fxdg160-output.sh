#!/bin/bash
# 每日批次作業：日作業-下傳舊核(會計) FXDG160
# 
# resource
source ./setdailyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="daily-004-fxdg160-output"
export JOB_NAME

# 提供匯入主檔供FM31 跨境貿易明細表使用 / 須下傳匯入主檔
# 檔案： xxxxx
fxdg160_xxx_output() {
    echo "s_ps_exchfil_ir_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/xxxx
    "${STEP_DIR}"/daily-004-fxdg160-job.sh "????"
    status=${?}
    echo "s_ps_exchfil_ir_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

fxdg160_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then 
        fxdg160_xxx_output
        
    else
        # 指定參數重跑
        case "${1}" in
        "1")
            fxdg160_xxx_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# fxdg160_main