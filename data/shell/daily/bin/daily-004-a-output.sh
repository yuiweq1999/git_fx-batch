#!/bin/bash

# resource
source ./setdailyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="daily-004-a-output"
export JOB_NAME

# 產生求償過渡科目傳票
# 檔案： VBAN.FX.S.PS.EXCHFIL.IR
s_ps_exchfil_ir_output() {
    echo "s_ps_exchfil_ir_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAN.FX.S.PS.EXCHFIL.IR
    "${STEP_DIR}"/daily-004-fxdu000-job.sh "????"
    status=${?}
    echo "s_ps_exchfil_ir_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入匯款兌換損益批次檔
# 檔案： VBA4.FX.S.SETTLE.POS.BUSTYPE6
s_settle_pos_bustype6_output() {
    echo "s_settle_pos_bustype6_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBA4.FX.S.SETTLE.POS.BUSTYPE6
    "${STEP_DIR}"/daily-004-fxdu000-job.sh "????"
    status=${?}
    echo "s_settle_pos_bustype6_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生即期未交割明細檔－匯入
# 檔案： VBAE.FX.S.A.PS.IR.FXKI02
s_a_ps_ir_fxki02_output() {
    echo "s_a_ps_ir_fxki02_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAE.FX.S.A.PS.IR.FXKI02
    "${STEP_DIR}"/daily-004-fxdu000-job.sh "????"
    status=${?}
    echo "s_a_ps_ir_fxki02_output result code:${status}"
    check_status_and_exit ${status}
}

# 挑選匯入53表徵資料檔
# 檔案： VBAH.FX.S.F53D.IR.SOURCE
s_f53d_ir_source_output() {
    echo "s_f53d_ir_source_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAH.FX.S.F53D.IR.SOURCE
    "${STEP_DIR}"/daily-004-fxd5320-job.sh "????"
    status=${?}
    echo "s_f53d_ir_source_output result code:${status}"
    check_status_and_exit ${status}
}

# 計算匯入求償各幣別本日餘額 , 產生匯入求償過渡傳票檔
# 檔案： VBAM.FX.K.IR.NODY.TRN.DS
# ==============
ir_nody_trn_ds_output() {
    echo "ir_nody_trn_ds_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAM.FX.K.IR.NODY.TRN.DS
    "${STEP_DIR}"/daily-004-fxdac00-job.sh "????"
    status=${?}
    echo "ir_nody_trn_ds_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 計算匯入求償各幣別本日餘額 , 產生匯入求償過渡傳票檔
# 檔案： VBAM.FX.S.IR.TX431.VOC
# ==============
ir_tx431_voc_output() {
    echo "ir_nody_trn_ds_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAM.FX.S.IR.TX431.VOC
    "${STEP_DIR}"/daily-004-fxdac00-job.sh "????"
    status=${?} 
    echo "ir_nody_trn_ds_output result code:${status}"
    check_status_and_exit ${status}
}

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

# 網銀匯入資料產出 - 線上解款
# 檔案： VBA7.FX.S.IR.NETBANK.DAY
s_ir_netbank_day_output() {
    echo "s_ir_netbank_day_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBA7.FX.S.IR.NETBANK.DAY
    "${STEP_DIR}"/daily-004-fxdm010-job.sh "????"
    status=${?}
    echo "s_ir_netbank_day_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入匯款每日損益資料檔
# 檔案： VMI0.MIS.S.IR.INT.DAILY
s_ir_int_daily_output() {
    echo "s_ir_int_daily_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VMI0.MIS.S.IR.INT.DAILY
    "${STEP_DIR}"/daily-004-fxdmis-job.sh "????"
    status=${?}
    echo "s_ir_int_daily_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入匯款每日損益資料檔
# 檔案： VMI0.MIS.S.IR.STANDARD.DAILY
s_ir_standard_daily_output() {
    echo "s_ir_standard_daily_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VMI0.MIS.S.IR.STANDARD.DAILY
    "${STEP_DIR}"/daily-004-fxdmis-job.sh "????"
    status=${?}
    echo "s_ir_standard_daily_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入匯款每日損益資料檔
# 檔案： VMI0.MIS.S.IR.AMT.DW
s_ir_amt_dw_output() {
    echo "s_ir_amt_dw_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VMI0.MIS.S.IR.AMT.DW
    "${STEP_DIR}"/daily-004-fxdmis-job.sh "????"
    status=${?}
    echo "s_ir_amt_dw_output result code:${status}"
    check_status_and_exit ${status}
}

# 產生匯入匯款每日損益資料檔
# 檔案： VMI0.MIS.S.IR.EMAIL
s_ir_email_output() {
    echo "s_ir_email_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VMI0.MIS.S.IR.EMAIL
    "${STEP_DIR}"/daily-004-fxdmis-job.sh "????"
    status=${?}
    echo "s_ir_email_output result code:${status}"
    check_status_and_exit ${status}
}

# 將匯入MIS資料MOD進POOL及FX共用檔
# 檔案： VMI0.MIS.S.IR.INT.DAILY.POOL
s_ir_int_daily_pool_output() {
    echo "s_ir_int_daily_pool_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VMI0.MIS.S.IR.INT.DAILY.POOL
    "${STEP_DIR}"/daily-004-fxdmis-job.sh "????"
    status=${?}
    echo "s_ir_int_daily_pool_output result code:${status}"
    check_status_and_exit ${status}
}

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

daily_004_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then 
        s_ps_exchfil_ir_output
        s_settle_pos_bustype6_output
        s_a_ps_ir_fxki02_output
        s_f53d_ir_source_output
        ir_nody_trn_ds_output
        ir_tx431_voc_output
        e_voucher_data_output
        s_exchange_data_output
        s_a_ir_other_output
        k_edit_number_or_output
        e_inter_branch_offset_output
        s_a_ir_glif_output
        s_a_ir_glif_tx431_output
        s_a_ir_glif_tx431_2_output
        s_ir_a837data_output
        fxdg160_xxx_output
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
        s_ir_netbank_day_output
        s_ir_int_daily_output
        s_ir_standard_daily_output
        s_ir_amt_dw_output
        s_ir_email_output
        s_ir_int_daily_pool_output
        s_decta_ir_output
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
        "4" | "s_f53d_ir_source_output")
            s_f53d_ir_source_output
            ;;  
        "5" | "ir_nody_trn_ds_output")
            ir_nody_trn_ds_output
            ;;
        "6" | "ir_tx431_voc_output")
            ir_tx431_voc_output
            ;;     
        "7" | "e_voucher_data_output")
            e_voucher_data_output
            ;;
        "8" | "s_exchange_data_output")
            s_exchange_data_output
            ;;
        "9" | "s_a_ir_other_output")
            s_a_ir_other_output
            ;;
        "10" | "k_edit_number_or_output")
            k_edit_number_or_output
            ;;      
        "11" | "e_inter_branch_offset_output")
            e_inter_branch_offset_output
            ;;
        "12" | "s_a_ir_glif_output")
            s_a_ir_glif_output
            ;; 
        "13" | "s_a_ir_glif_tx431_output")
            s_a_ir_glif_tx431_output
            ;; 
        "14" | "s_a_ir_glif_tx431_2_output")
            s_a_ir_glif_tx431_2_output
            ;; 
        "15" | "s_ir_a837data_output")
            s_ir_a837data_output
            ;; 
        "16" | "fxdg160_xxx_output")
            fxdg160_xxx_output
            ;;    
        "17" | "s_ir_iran_output")
            s_ir_iran_output
            ;;
        "18" | "s_ir_iran_other_output")
            s_ir_iran_other_output
            ;;  
        "19" | "s_pt_ir_stbcf_output")
            s_pt_ir_stbcf_output
            ;;
        "20" | "s_pt_ir_stbjm1_output")
            s_pt_ir_stbjm1_output
            ;;
        "21" | "s_ir_aa_output")
            s_ir_aa_output
            ;;            
        "22" | "s_ir_remit_output")
            s_ir_remit_output
            ;;
        "23" | "x_xxxx_output")
            x_xxxx_output
            ;;
        "24" | "s_ir_accsub_output")
            s_ir_accsub_output
            ;; 
        "25" | "s_ir_accmain_a87d_output")
            s_ir_accmain_a87d_output
            ;;  
        "26" | "s_ir_accsub_obu_output")
            s_ir_accsub_obu_output
            ;;
        "27" | "s_ir_accmain_a87d_obu_output")
            s_ir_accmain_a87d_obu_output
            ;; 
        "28" | "s_ir_z6_day_output")
            s_ir_z6_day_output
            ;; 
        "29" | "s_fx_obbs_output")
            s_fx_obbs_output
            ;; 
        "30" | "s_ir_authfile_output")
            s_ir_authfile_output
            ;;       
        "31" | "s_ir_netbank_day_output")
            s_ir_netbank_day_output
            ;;
        "32" | "s_ir_int_daily_output")
            s_ir_int_daily_output
            ;;
        "33" | "s_ir_standard_daily_output")
            s_ir_standard_daily_output
            ;;  
        "34" | "s_ir_amt_dw_output")
            s_ir_amt_dw_output
            ;;
        "35" | "s_ir_email_output")
            s_ir_email_output
            ;;
        "36" | "s_ir_int_daily_pool_output")
            s_ir_int_daily_pool_output
            ;;   
        "37" | "s_decta_ir_output")
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
=======
# daily_004_main
