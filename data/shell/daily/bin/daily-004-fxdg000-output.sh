#!/bin/bash
# 每日批次作業：日作業-下傳舊核(會計) FXDG000
# 
# resource
source ./setdailyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="daily-004-fxdg000-output"
export JOB_NAME

# 產生匯入VOUCHER資料
# 檔案： VBA2.FX.E.VOUCHER.DATA
e_voucher_data_output() {
    echo "e_voucher_data_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBA2.FX.E.VOUCHER.DATA
    "${STEP_DIR}"/daily-004-fxdg000-job.sh "????"
    status=${?}
    echo "e_voucher_data_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入VOUCHER, EXCHANGE,OTHER資料
# 檔案： VBA2.FX.S.EXCHANGE.DATA
s_exchange_data_output() {
    echo "s_exchange_data_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBA2.FX.S.EXCHANGE.DATA
    "${STEP_DIR}"/daily-004-fxdg000-job.sh "????"
    status=${?}
    echo "s_exchange_data_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入VOUCHER, EXCHANGE,OTHER資料
# 檔案： VBAM.FX.S.A.IR.OTHER
s_a_ir_other_output() {
    echo "s_a_ir_other_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAM.FX.S.A.IR.OTHER
    "${STEP_DIR}"/daily-004-fxdg000-job.sh "????"
    status=${?}
    echo "s_a_ir_other_output result code:${status}"
    check_status_and_exit ${status}
}

# 寫聯往OFFSET檔，回寫編號檔(7) 聯行往來編號
# 檔案： VBA6.FX.K.EDIT.NUMBER.OR
k_edit_number_or_output() {
    echo "k_edit_number_or_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBA6.FX.K.EDIT.NUMBER.OR
    "${STEP_DIR}"/daily-004-fxdg000-job.sh "????"
    status=${?}
    echo "k_edit_number_or_output result code:${status}"
    check_status_and_exit ${status}
}

# 寫聯往OFFSET檔，回寫編號檔(7) 聯行往來編號
# 檔案： VBA3.FX.E.INTER.BRANCH.OFFSET
e_inter_branch_offset_output() {
    echo "e_inter_branch_offset_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBA3.FX.E.INTER.BRANCH.OFFSET
    "${STEP_DIR}"/daily-004-fxdg000-job.sh "????"
    status=${?}
    echo "e_inter_branch_offset_output result code:${status}"
    check_status_and_exit ${status}
}

# 寫入自動放行和期貨商自動入帳寫入 GLIF
# 檔案： VBAF.FX.S.A.IR.GLIF
s_a_ir_glif_output() {
    echo "s_a_ir_glif_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAF.FX.S.A.IR.GLIF
    "${STEP_DIR}"/daily-004-fxdg000-job.sh "????"
    status=${?}
    echo "s_a_ir_glif_output result code:${status}"
    check_status_and_exit ${status}
}

# 列印台幣過渡帳務部位會計分錄 
# 檔案： VBAM.FX.S.A.IR.GLIF.TX431
s_a_ir_glif_tx431_output() {
    echo "s_a_ir_glif_tx431_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAM.FX.S.A.IR.GLIF.TX431
    "${STEP_DIR}"/daily-004-fxdg000-job.sh "????"
    status=${?}
    echo "s_a_ir_glif_tx431_output result code:${status}"
    check_status_and_exit ${status}
}

# 將匯入求償放入部位 GLIF 
# 檔案： VBAM.FX.S.A.IR.GLIF.TX431
s_a_ir_glif_tx431_2_output() {
    echo "s_a_ir_glif_tx431_2_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAM.FX.S.A.IR.GLIF.TX431
    "${STEP_DIR}"/daily-004-fxdg000-job.sh "????"
    status=${?}
    echo "s_a_ir_glif_tx431_2_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入A837資料檔 
# 檔案： VBA7.FX.S.IR.A837DATA
s_ir_a837data_output() {
    echo "s_ir_a837data_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBA7.FX.S.IR.A837DATA
    "${STEP_DIR}"/daily-004-fxdg000-job.sh "????"
    status=${?}
    echo "s_ir_a837data_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

fxdg000_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        e_voucher_data_output
        s_exchange_data_output
        s_a_ir_other_output
        k_edit_number_or_output
        e_inter_branch_offset_output
        s_a_ir_glif_output
        s_a_ir_glif_tx431_output
        s_a_ir_glif_tx431_2_output
        s_ir_a837data_output
        
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "e_voucher_data_output")
            e_voucher_data_output
            ;;
        "2" | "s_exchange_data_output")
            s_exchange_data_output
            ;;
        "3" | "s_a_ir_other_output")
            s_a_ir_other_output
            ;;
        "4")
            k_edit_number_or_output
            ;;      
        "5")
            e_inter_branch_offset_output
            ;;
        "6")
            s_a_ir_glif_output
            ;; 
        "7")
            s_a_ir_glif_tx431_output
            ;; 
        "8")
            s_a_ir_glif_tx431_2_output
            ;; 
        "9")
            s_ir_a837data_output
            ;;     
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# fxdg000_main