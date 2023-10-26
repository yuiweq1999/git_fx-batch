#!/bin/bash
# 每週批次作業：週作業
# 
# ==============

# resource
# ==============
source ./setweeklyenv.sh
STEP_DIR='.'

# control-M使用到的環境變數
JOB_NAME="weekly-001-fxwir00-output"
export JOB_NAME
# ==============

# 產生一般管理稽查工作底稿 
# 檔案： VAU0.FX.S.IR.AUDIT
# ==============
s_ir_audit_output() {
    echo "s_ir_audit_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VAU0.FX.S.IR.AUDIT
    "${STEP_DIR}"/weekly-001-fxwir00-job.sh "????"
    status=${?}
    echo "s_ir_audit_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============


# ==============
fxwir00_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        s_ir_audit_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "s_ir_audit_output")
            s_ir_audit_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# s_ir_audit_output
# fxwir00_main "${@}"

# ==============