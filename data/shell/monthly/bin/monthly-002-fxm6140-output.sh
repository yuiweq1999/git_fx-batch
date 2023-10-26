#!/bin/bash
# 每月批次作業：月作業-下傳舊核 FXM6140
#
# ==============

# resource
# ==============
source ./setmonthlyenv.sh
STEP_DIR='.'

# control-M使用到的環境變數
JOB_NAME="monthly-002-fxm6140-output"
export JOB_NAME
# ==============

# 匯入挑入費用暫存檔
# 檔案： VBAI.FX.S.IR.FXCHG
# ==============
s_ir_fxchg_output() {
    echo "s_ir_fxchg_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAI.FX.S.IR.FXCHG
    "${STEP_DIR}"/monthly-002-fxm6140-job.sh "????"
    status=${?}
    echo "s_ir_fxchg_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行fxm6140
# ==============
fxm6140_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        s_ir_fxchg_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "s_ir_fxchg_output")
            s_ir_fxchg_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# s_ir_fxchg_output
# fxm6140_main "${@}"

# ==============
