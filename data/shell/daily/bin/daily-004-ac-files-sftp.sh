#!/bin/bash
# 每日批次作業：日作業-下傳舊核(會計)-連線sftp
# 
# ==============

# resource
# ==============
source ./setdailyenv.sh
source ./daily-sftp-setting1.sh

# control-M使用到的環境變數
JOB_NAME="daily-004-ac-files-sftp"
export JOB_NAME
# ==============

# 計算匯入求償各幣別本日餘額 , 產生匯入求償過渡傳票檔
# 檔案： VBAM.FX.K.IR.NODY.TRN.DS
# ==============
ir_nody_trn_ds_sftp() {
    echo "ir_nody_trn_ds_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAM.FX.K.IR.NODY.TRN.DS"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "ir_nody_trn_ds_sftp result code:${status}"
    check_status_and_exit ${status}
}

# 計算匯入求償各幣別本日餘額 , 產生匯入求償過渡傳票檔
# 檔案： VBAM.FX.S.IR.TX431.VOC
# ==============
ir_tx431_voc_sftp() {
    echo "ir_tx431_voc_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAM.FX.S.IR.TX431.VOC"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "ir_tx431_voc_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入VOUCHER資料
# 檔案： VBA2.FX.E.VOUCHER.DATA
# ==============
e_voucher_data_sftp() {
    echo "e_voucher_data_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBA2.FX.E.VOUCHER.DATA"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "e_voucher_data_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入VOUCHER, EXCHANGE,OTHER資料
# 檔案： VBA2.FX.S.EXCHANGE.DATA
# ==============
s_exchange_data_sftp() {
    echo "s_exchange_data_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBA2.FX.E.VOUCHER.DATA"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_exchange_data_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入VOUCHER, EXCHANGE,OTHER資料
# 檔案： VBAM.FX.S.A.IR.OTHER
# ==============
s_a_ir_other_sftp() {
    echo "s_a_ir_other_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAM.FX.S.A.IR.OTHER"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_a_ir_other_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 寫聯往OFFSET檔，回寫編號檔(7) 聯行往來編號
# 檔案： VBA6.FX.K.EDIT.NUMBER.OR
# ==============
k_edit_number_or_sftp() {
    echo "k_edit_number_or_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBA6.FX.K.EDIT.NUMBER.OR"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "k_edit_number_or_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 寫聯往OFFSET檔，回寫編號檔(7) 聯行往來編號
# 檔案： VBA3.FX.E.INTER.BRANCH.OFFSET
# ==============
e_inter_branch_offset_sftp() {
    echo "e_inter_branch_offset_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBA3.FX.E.INTER.BRANCH.OFFSET"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "e_inter_branch_offset_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 寫入自動放行和期貨商自動入帳寫入 GLIF
# 檔案： VBAF.FX.S.A.IR.GLIF
# ==============
s_a_ir_glif_sftp() {
    echo "s_a_ir_glif_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAF.FX.S.A.IR.GLIF"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_a_ir_glif_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 列印台幣過渡帳務部位會計分錄
# 檔案： VBAM.FX.S.A.IR.GLIF.TX431
# ==============
s_a_ir_glif_tx431_sftp() {
    echo "s_a_ir_glif_tx431_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAM.FX.S.A.IR.GLIF.TX431"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_a_ir_glif_tx431_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 將匯入求償放入部位 GLIF
# 檔案： VBAM.FX.S.A.IR.GLIF.TX431
# todo： 確認是否為同一個檔案
# ==============
s_a_ir_glif_tx431_2_sftp() {
    echo "s_a_ir_glif_tx431_2_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAM.FX.S.A.IR.GLIF.TX431"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_a_ir_glif_tx431_2_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入A837資料檔
# 檔案： VBA7.FX.S.IR.A837DATA
# ==============
s_ir_a837data_sftp() {
    echo "s_ir_a837data_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAM.FX.S.A.IR.GLIF.TX431"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ir_a837data_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生伊朗匯入匯款資料
# 檔案： VBA6.FX.S.IR.IRAN
# ==============
s_ir_iran_sftp() {
    echo "s_ir_iran_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBA6.FX.S.IR.IRAN"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ir_iran_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生伊朗匯入匯款資料
# 檔案： VBA6.FX.S.IR.IRAN.OTHER
# ==============
s_ir_iran_other_sftp() {
    echo "s_ir_iran_other_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBA6.FX.S.IR.IRAN.OTHER"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ir_iran_other_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生伊朗匯入匯款資料
# 檔案： VBA4.FX.S.PT.IR.STBCF
# ==============
s_pt_ir_stbcf_sftp() {
    echo "s_pt_ir_stbcf_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBA4.FX.S.PT.IR.STBCF"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_pt_ir_stbcf_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生伊朗匯入匯款資料
# 檔案： VBA4.FX.S.PT.IR.STBJM1
# ==============
s_pt_ir_stbjm1_sftp() {
    echo "s_pt_ir_stbjm1_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBA4.FX.S.PT.IR.STBJM1"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_pt_ir_stbjm1_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生伊朗匯入匯款資料
# 檔案： VBAQ.FX.S.IR.AA
# ==============
s_ir_aa_sftp() {
    echo "s_ir_aa_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAQ.FX.S.IR.AA"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ir_aa_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生聯行往來明細檔
# 檔案： VBA7.FX.S.IR.REMIT
# ==============
s_ir_remit_sftp() {
    echo "s_ir_remit_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBA7.FX.S.IR.REMIT"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ir_remit_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 外匯分行檔承作量累計
# 檔案： ????
# ==============
x_xxxx_sftp() {
    echo "x_xxxx_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="xxxx"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "x_xxxx_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款會計總帳餘額及會計科子目比對檔
# 檔案： VBAQ.FX.S.IR.ACCSUB
# ==============
s_ir_accsub_sftp() {
    echo "s_ir_accsub_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAQ.FX.S.IR.ACCSUB"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ir_accsub_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款會計總帳餘額及會計科子目比對檔
# 檔案： VBAC.FX.S.IR.ACCMAIN.A87D
# ==============
s_ir_accmain_a87d_sftp() {
    echo "s_ir_accmain_a87d_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAC.FX.S.IR.ACCMAIN.A87D"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ir_accmain_a87d_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款會計總帳餘額及會計科子目比對檔
# 檔案： VBAC.FX.S.IR.ACCSUB.OBU
# ==============
s_ir_accsub_obu_sftp() {
    echo "s_ir_accsub_obu_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAC.FX.S.IR.ACCSUB.OBU"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ir_accsub_obu_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款會計總帳餘額及會計科子目比對檔
# 檔案： VBAC.FX.S.IR.ACCMAIN.A87D.OBU
# ==============
s_ir_accmain_a87d_obu_sftp() {
    echo "s_ir_accmain_a87d_obu_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAC.FX.S.IR.ACCMAIN.A87D.OBU"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ir_accmain_a87d_obu_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生 Z6 匯入資料及美國地區海外分行匯入資料
# 檔案： VBAP.FX.S.IR.Z6.DAY
# ==============
s_ir_z6_day_sftp() {
    echo "s_ir_z6_day_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAP.FX.S.IR.Z6.DAY"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ir_z6_day_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生 Z6 匯入資料及美國地區海外分行匯入資料
# 檔案： VBAP.FX.S.FX.OBBS
# ==============
s_fx_obbs_sftp() {
    echo "s_fx_obbs_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAP.FX.S.FX.OBBS"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_fx_obbs_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入高風險國家資料
# 檔案： VBAE.FX.S.IR.AUTHFILE
# ==============
s_ir_authfile_sftp() {
    echo "s_ir_authfile_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAE.FX.S.IR.AUTHFILE"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ir_authfile_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入DECTA資料檔
# 檔案： VBAP.FX.S.DECTA.IR
# ==============
s_decta_ir_sftp() {
    echo "s_decta_ir_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAP.FX.S.DECTA.IR"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_decta_ir_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 挑選匯入53表徵資料檔
# 檔案： VBAH.FX.S.F53D.IR.SOURCE
# ==============
s_f53d_ir_source_sftp() {
    echo "s_f53d_ir_source_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAH.FX.S.F53D.IR.SOURCE"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_f53d_ir_source_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生求償過渡科目傳票
# 檔案： VBAN.FX.S.PS.EXCHFIL.IR
# ==============
s_ps_exchfil_ir_sftp() {
    echo "s_ps_exchfil_ir_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAN.FX.S.PS.EXCHFIL.IR"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ps_exchfil_ir_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款兌換損益批次檔
# 檔案： VBA4.FX.S.SETTLE.POS.BUSTYPE6
# ==============
s_settle_pos_bustype6_sftp() {
    echo "s_settle_pos_bustype6_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBA4.FX.S.SETTLE.POS.BUSTYPE6"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_settle_pos_bustype6_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生即期未交割明細檔－匯入
# 檔案： VBAE.FX.S.A.PS.IR.FXKI02
# ==============
s_a_ps_ir_fxki02_sftp() {
    echo "s_a_ps_ir_fxki02_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAE.FX.S.A.PS.IR.FXKI02"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_a_ps_ir_fxki02_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款每日損益資料檔
# 檔案： VMI0.MIS.S.IR.INT.DAILY
# ==============
s_ir_int_daily_sftp() {
    echo "s_ir_int_daily_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VMI0.MIS.S.IR.INT.DAILY"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ir_int_daily_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款每日損益資料檔
# 檔案： VMI0.MIS.S.IR.STANDARD.DAILY
# ==============
s_ir_standard_daily_sftp() {
    echo "s_ir_standard_daily_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VMI0.MIS.S.IR.STANDARD.DAILY"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ir_standard_daily_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款每日損益資料檔
# 檔案： VMI0.MIS.S.IR.AMT.DW
# ==============
s_ir_amt_dw_sftp() {
    echo "s_ir_standard_daily_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VMI0.MIS.S.IR.AMT.DW"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ir_standard_daily_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款每日損益資料檔
# 檔案： VMI0.MIS.S.IR.EMAIL
# ==============
s_ir_email_sftp() {
    echo "s_ir_email_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VMI0.MIS.S.IR.EMAIL"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ir_email_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 將匯入MIS資料MOD進POOL及FX共用檔
# 檔案： VMI0.MIS.S.IR.INT.DAILY.POOL
# ==============
s_ir_int_daily_pool_sftp() {
    echo "s_ir_int_daily_pool_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VMI0.MIS.S.IR.INT.DAILY.POOL"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ir_int_daily_pool_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 提供匯入主檔供FM31 跨境貿易明細表使用 / 須下傳匯入主檔
# 檔案： xxxxx
# ==============
fxdg160_xxx_sftp() {
    echo "fxdg160_xxx_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="xxxxx"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "fxdg160_xxx_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 網銀匯入資料產出 - 線上解款
# 檔案： VBA7.FX.S.IR.NETBANK.DAY
# ==============
s_ir_netbank_day_sftp() {
    echo "s_ir_netbank_day_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBA7.FX.S.IR.NETBANK.DAY"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "s_ir_netbank_day_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行sftp連線
# ==============
ac_files_sftp_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        ir_nody_trn_ds_sftp
        ir_tx431_voc_sftp
        e_voucher_data_sftp
        s_exchange_data_sftp
        s_a_ir_other_sftp
        k_edit_number_or_sftp
        e_inter_branch_offset_sftp
        s_a_ir_glif_sftp
        s_a_ir_glif_tx431_sftp
        s_a_ir_glif_tx431_2_sftp
        s_ir_a837data_sftp
        s_ir_iran_sftp
        s_ir_iran_other_sftp
        s_pt_ir_stbcf_sftp
        s_pt_ir_stbjm1_sftp
        s_ir_aa_sftp
        s_ir_remit_sftp
        x_xxxx_sftp
        s_ir_accsub_sftp
        s_ir_accmain_a87d_sftp
        s_ir_accsub_obu_sftp
        s_ir_accmain_a87d_obu_sftp
        s_ir_z6_day_sftp
        s_fx_obbs_sftp
        s_ir_authfile_sftp
        s_decta_ir_sftp
        s_f53d_ir_source_sftp
        s_ps_exchfil_ir_sftp
        s_settle_pos_bustype6_sftp
        s_a_ps_ir_fxki02_sftp
        s_ir_int_daily_sftp
        s_ir_standard_daily_sftp
        s_ir_amt_dw_sftp
        s_ir_email_sftp
        s_ir_int_daily_pool_sftp
        fxdg160_xxx_sftp
        s_ir_netbank_day_sftp

    else
        # 指定參數重跑
        case "${1}" in
        1 | "ir_nody_trn_ds_sftp")
            ir_nody_trn_ds_sftp
            ;;
        2 | "ir_tx431_voc_sftp")
            ir_tx431_voc_sftp
            ;;
        3 | "e_voucher_data_sftp")
            e_voucher_data_sftp
            ;;
        4 | "s_exchange_data_sftp")
            s_exchange_data_sftp
            ;;
        5 | "s_a_ir_other_sftp")
            s_a_ir_other_sftp
            ;;
        6 | "k_edit_number_or_sftp")
            k_edit_number_or_sftp
            ;;
        7 | "e_inter_branch_offset_sftp")
            e_inter_branch_offset_sftp
            ;;
        8 | "s_a_ir_glif_sftp")
            s_a_ir_glif_sftp
            ;;
        9 | "s_a_ir_glif_tx431_sftp")
            s_a_ir_glif_tx431_sftp
            ;;
        10 | "s_a_ir_glif_tx431_2_sftp")
            s_a_ir_glif_tx431_2_sftp
            ;;
        11 | "s_ir_a837data_sftp")
            s_ir_a837data_sftp
            ;;
        12 | "s_ir_iran_sftp")
            s_ir_iran_sftp
            ;;
        13 | "s_ir_iran_other_sftp")
            s_ir_iran_other_sftp
            ;;
        14 | "s_pt_ir_stbcf_sftp")
            s_pt_ir_stbcf_sftp
            ;;
        15 | "s_pt_ir_stbjm1_sftp")
            s_pt_ir_stbjm1_sftp
            ;;
        16 | "s_ir_aa_sftp")
            s_ir_aa_sftp
            ;;
        17 | "s_ir_remit_sftp")
            s_ir_remit_sftp
            ;;
        18 | "x_xxxx_sftp")
            x_xxxx_sftp
            ;;
        19 | "s_ir_accsub_sftp")
            s_ir_accsub_sftp
            ;;
        20 | "s_ir_accmain_a87d_sftp")
            s_ir_accmain_a87d_sftp
            ;;
        21 | "s_ir_accsub_obu_sftp")
            s_ir_accsub_obu_sftp
            ;;
        22 | "s_ir_accmain_a87d_obu_sftp")
            s_ir_accmain_a87d_obu_sftp
            ;;
        23 | "s_ir_z6_day_sftp")
            s_ir_z6_day_sftp
            ;;
        24 | "s_fx_obbs_sftp")
            s_fx_obbs_sftp
            ;;
        25 | "s_ir_authfile_sftp")
            s_ir_authfile_sftp
            ;;
        26 | "s_decta_ir_sftp")
            s_decta_ir_sftp
            ;;
        27 | "s_f53d_ir_source_sftp")
            s_f53d_ir_source_sftp
            ;;
        28 | "s_ps_exchfil_ir_sftp")
            s_ps_exchfil_ir_sftp
            ;;
        29 | "s_settle_pos_bustype6_sftp")
            s_settle_pos_bustype6_sftp
            ;;
        30 | "s_a_ps_ir_fxki02_sftp")
            s_a_ps_ir_fxki02_sftp
            ;;
        31 | "s_ir_int_daily_sftp")
            s_ir_int_daily_sftp
            ;;
        32 | "s_ir_standard_daily_sftp")
            s_ir_standard_daily_sftp
            ;;
        33 | "s_ir_amt_dw_sftp")
            s_ir_amt_dw_sftp
            ;;
        34 | "s_ir_email_sftp")
            s_ir_email_sftp
            ;;
        35 | "s_ir_int_daily_pool_sftp")
            s_ir_int_daily_pool_sftp
            ;;
        36 | "fxdg160_xxx_sftp")
            fxdg160_xxx_sftp
            ;;
        37 | "s_ir_netbank_day_sftp")
            s_ir_netbank_day_sftp
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試單一step與sftp_main
# k_edit_number_or_sftp
# ac_files_sftp_main "${@}"

# ==============