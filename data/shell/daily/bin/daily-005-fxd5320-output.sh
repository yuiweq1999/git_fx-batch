#!/bin/bash
# 每日批次作業：日作業-下傳舊核(共用) FXD5320
# 
# resource
source ./setdailyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="daily-005-fxd5320-output"
export JOB_NAME

# 挑選匯入53表徵資料檔
# 檔案： VBAH.FX.S.F53D.IR.SOURCE
s_f53d_ir_source_output() {
    echo "s_f53d_ir_source_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAH.FX.S.F53D.IR.SOURCE
    "${STEP_DIR}"/daily-005-fxd5320-job.sh "????"
    status=${?}
    echo "s_f53d_ir_source_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

fxd5320_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        s_f53d_ir_source_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "s_f53d_ir_source_output")
            s_f53d_ir_source_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# fxd5320_main