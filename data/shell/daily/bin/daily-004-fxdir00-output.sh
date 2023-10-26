#!/bin/bash
# 每日批次作業：日作業-下傳舊核(會計) FXDIR00
# 
# resource
source ./setdailyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="daily-004-fxdir00-output"
export JOB_NAME

# 產生伊朗匯入匯款資料
# 檔案： VBA6.FX.S.IR.IRAN
s_ir_iran_output() {
    echo "s_ir_iran_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBA6.FX.S.IR.IRAN
    "${STEP_DIR}"/daily-004-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_iran_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生伊朗匯入匯款資料
# 檔案： VBA6.FX.S.IR.IRAN.OTHER
s_ir_iran_other_output() {
    echo "s_ir_iran_other_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBA6.FX.S.IR.IRAN.OTHER
    "${STEP_DIR}"/daily-004-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_iran_other_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生央媒申報資料檔相關作業
# 檔案： VBA4.FX.S.PT.IR.STBCF
s_pt_ir_stbcf_output() {
    echo "s_pt_ir_stbcf_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBA4.FX.S.PT.IR.STBCF
    "${STEP_DIR}"/daily-004-fxdir00-job.sh "????"
    status=${?}
    echo "s_pt_ir_stbcf_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生央媒申報資料檔相關作業
# 檔案： VBA4.FX.S.PT.IR.STBJM1
s_pt_ir_stbjm1_output() {
    echo "s_pt_ir_stbjm1_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBA4.FX.S.PT.IR.STBJM1
    "${STEP_DIR}"/daily-004-fxdir00-job.sh "????"
    status=${?}
    echo "s_pt_ir_stbjm1_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生央媒申報資料檔相關作業
# 檔案： VBAQ.FX.S.IR.AA
s_ir_aa_output() {
    echo "s_ir_aa_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAQ.FX.S.IR.AA
    "${STEP_DIR}"/daily-004-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_aa_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生聯行往來明細檔
# 檔案： VBA7.FX.S.IR.REMIT
s_ir_remit_output() {
    echo "s_ir_remit_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBA7.FX.S.IR.REMIT
    "${STEP_DIR}"/daily-004-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_remit_output result code:${status}"
    check_status_and_exit ${status}
}

# 外匯分行檔承作量累計 / 新核新訂定之檔案
# 檔案： ????
x_xxxx_output() {
    echo "s_ir_remit_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/xxxx
    "${STEP_DIR}"/daily-004-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_remit_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入匯款會計總帳餘額及會計科子目比對檔
# 檔案： VBAQ.FX.S.IR.ACCSUB
s_ir_accsub_output() {
    echo "s_ir_accsub_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAQ.FX.S.IR.ACCSUB
    "${STEP_DIR}"/daily-004-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_accsub_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入匯款會計總帳餘額及會計科子目比對檔
# 檔案： VBAC.FX.S.IR.ACCMAIN.A87D
s_ir_accmain_a87d_output() {
    echo "s_ir_accmain_a87d_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAC.FX.S.IR.ACCMAIN.A87D
    "${STEP_DIR}"/daily-004-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_accmain_a87d_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入匯款會計總帳餘額及會計科子目比對檔
# 檔案： VBAC.FX.S.IR.ACCSUB.OBU
s_ir_accsub_obu_output() {
    echo "s_ir_accsub_obu_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAC.FX.S.IR.ACCSUB.OBU
    "${STEP_DIR}"/daily-004-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_accsub_obu_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入匯款會計總帳餘額及會計科子目比對檔
# 檔案： VBAC.FX.S.IR.ACCSUB.OBU
s_ir_accsub_obu_output() {
    echo "s_ir_accsub_obu_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAC.FX.S.IR.ACCSUB.OBU
    "${STEP_DIR}"/daily-004-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_accsub_obu_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入匯款會計總帳餘額及會計科子目比對檔
# 檔案： VBAC.FX.S.IR.ACCMAIN.A87D.OBU
s_ir_accmain_a87d_obu_output() {
    echo "s_ir_accmain_a87d_obu_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAC.FX.S.IR.ACCMAIN.A87D.OBU
    "${STEP_DIR}"/daily-004-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_accmain_a87d_obu_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生 Z6 匯入資料及美國地區海外分行匯入資料
# 檔案： VBAP.FX.S.IR.Z6.DAY
s_ir_z6_day_output() {
    echo "s_ir_z6_day_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAP.FX.S.IR.Z6.DAY
    "${STEP_DIR}"/daily-004-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_z6_day_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生 Z6 匯入資料及美國地區海外分行匯入資料
# 檔案： VBAP.FX.S.FX.OBBS
s_fx_obbs_output() {
    echo "s_fx_obbs_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAP.FX.S.FX.OBBS
    "${STEP_DIR}"/daily-004-fxdir00-job.sh "????"
    status=${?}
    echo "s_fx_obbs_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入高風險國家資料
# 檔案： VBAE.FX.S.IR.AUTHFILE
s_ir_authfile_output() {
    echo "s_ir_authfile_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAE.FX.S.IR.AUTHFILE
    "${STEP_DIR}"/daily-004-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_authfile_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

fxdir00_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        s_ir_iran_output
        s_ir_iran_other_output
        s_pt_ir_stbcf_output
        s_pt_ir_stbjm1_output
        s_ir_aa_output
        s_ir_remit_output
        x_xxxx_output
        s_ir_accsub_output
        s_ir_accmain_a87d_output
        s_ir_accsub_obu_output
        s_ir_accmain_a87d_obu_output
        s_ir_z6_day_output
        s_fx_obbs_output
        s_ir_authfile_output
        
        
    else
        # 指定參數重跑
        case "${1}" in
        "1")
            s_ir_iran_output
            ;;
        "2")
            s_ir_iran_other_output
            ;;  
        "3")
            s_pt_ir_stbcf_output
            ;;
        "4")
            s_pt_ir_stbjm1_output
            ;;
        "5")
            s_ir_aa_output
            ;;            
        "6")
            s_ir_remit_output
            ;;
        "7")
            x_xxxx_output
            ;;
        "8")
            s_ir_accsub_output
            ;; 
        "9")
            s_ir_accmain_a87d_output
            ;;  
        "10")
            s_ir_accsub_obu_output
            ;;
        "11")
            s_ir_accmain_a87d_obu_output
            ;; 
        "12")
            s_ir_z6_day_output
            ;; 
        "13")
            s_fx_obbs_output
            ;; 
        "14")
            s_ir_authfile_output
            ;;  
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# fxdir00_main