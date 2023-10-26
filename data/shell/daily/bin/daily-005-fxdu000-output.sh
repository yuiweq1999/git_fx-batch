#!/bin/bash
# 每日批次作業：日作業-下傳舊核(共用) FXDU000
# 
# resource
source ./setdailyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="daily-005-fxdu000-output"
export JOB_NAME

# 產生求償過渡科目傳票
# 檔案： VBAN.FX.S.PS.EXCHFIL.IR
s_ps_exchfil_ir_output() {
    echo "s_ps_exchfil_ir_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAN.FX.S.PS.EXCHFIL.IR
    "${STEP_DIR}"/daily-005-fxdu000-job.sh "????"
    status=${?}
    echo "s_ps_exchfil_ir_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入匯款兌換損益批次檔
# 檔案： VBA4.FX.S.SETTLE.POS.BUSTYPE6
s_settle_pos_bustype6_output() {
    echo "s_settle_pos_bustype6_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBA4.FX.S.SETTLE.POS.BUSTYPE6
    "${STEP_DIR}"/daily-005-fxdu000-job.sh "????"
    status=${?}
    echo "s_settle_pos_bustype6_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生即期未交割明細檔－匯入
# 檔案： VBAE.FX.S.A.PS.IR.FXKI02
s_a_ps_ir_fxki02_output() {
    echo "s_a_ps_ir_fxki02_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAE.FX.S.A.PS.IR.FXKI02
    "${STEP_DIR}"/daily-005-fxdu000-job.sh "????"
    status=${?}
    echo "s_a_ps_ir_fxki02_output result code:${status}"
    check_status_and_exit ${status}
}



# ==============

fxdu000_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then 
        s_ps_exchfil_ir_output
        s_settle_pos_bustype6_output
        s_a_ps_ir_fxki02_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "s_ps_exchfil_ir_output")
            s_ps_exchfil_ir_output
            ;;
        "2" | "s_settle_pos_bustype6_output")
            s_settle_pos_bustype6_output
            ;;  
        "3" | "s_a_ps_ir_fxki02_output")
            s_a_ps_ir_fxki02_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
fxdu000_main