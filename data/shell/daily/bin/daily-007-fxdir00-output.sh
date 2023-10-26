#!/bin/bash
# 每日批次作業：日上下傳作業 FXDIR00
#
# ==============

# resource
# ==============
source ./setdailyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="daily-007-fxdir00-report"
export JOB_NAME

# ==============

# 產生匯入匯款DW相關資料檔
# 報表： VAP1.FX.S.IR.DW.IRMARK
# ==============
s_ir_dw_irmark_output() {
    echo "s_ir_dw_irmark_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VAP1.FX.S.IR.DW.IRMARK
    "${STEP_DIR}"/daily-007-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_dw_irmark_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款DW相關資料檔
# 報表： VAP1.FX.S.IR.TRN.TX411
# ==============
s_ir_trn_tx411_output() {
    echo "s_ir_trn_tx411_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VAP1.FX.S.IR.TRN.TX411
    "${STEP_DIR}"/daily-007-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_trn_tx411_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款DW相關資料檔
# 檔案： VAP1.FX.S.IR.TRN.TX421
# ==============
s_ir_trn_tx421_output() {
    echo "s_ir_trn_tx421_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VAP1.FX.S.IR.TRN.TX421
    "${STEP_DIR}"/daily-007-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_trn_tx421_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款DW相關資料檔
# 檔案： VAP1.FX.S.IR.TRN.TX441
# ==============
s_ir_trn_tx441_output() {
    echo "s_ir_trn_tx441_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VAP1.FX.S.IR.TRN.TX441
    "${STEP_DIR}"/daily-007-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_trn_tx441_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款DW相關資料檔
# 檔案： VAP1.FX.S.IR.TRN.TX461
# ==============
s_ir_trn_tx461_output() {
    echo "s_ir_trn_tx461_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VAP1.FX.S.IR.TRN.TX461
    "${STEP_DIR}"/daily-007-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_trn_tx461_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款DW相關資料檔
# 檔案： VAP1.FX.S.IR.TRN.TX471
# ==============
s_ir_trn_tx471_output() {
    echo "s_ir_trn_tx471_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VAP1.FX.S.IR.TRN.TX471
    "${STEP_DIR}"/daily-007-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_trn_tx471_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款DW相關資料檔
# 檔案： VAP1.FX.S.IR.TRN.TX481
# ==============
s_ir_trn_tx481_output() {
    echo "s_ir_trn_tx481_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VAP1.FX.S.IR.TRN.TX481
    "${STEP_DIR}"/daily-007-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_trn_tx481_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款DW相關資料檔
# 檔案： VAP1.FX.S.IR.TRN.TX491
# ==============
s_ir_trn_tx491_output() {
    echo "s_ir_trn_tx491_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VAP1.FX.S.IR.TRN.TX491
    "${STEP_DIR}"/daily-007-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_trn_tx491_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款DW相關資料檔
# 檔案： VAP1.FX.S.IR.TRN.TX401
# ==============
s_ir_trn_tx401_output() {
    echo "s_ir_trn_tx401_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VAP1.FX.S.IR.TRN.TX401
    "${STEP_DIR}"/daily-007-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_trn_tx401_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 篩選跨境支付業務解款交易資料
# 檔案： VBA5.FX.S.IR.F1.DATA
# ==============
s_ir_f1_data_output() {
    echo "s_ir_f1_data_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBA5.FX.S.IR.F1.DATA
    "${STEP_DIR}"/daily-007-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_f1_data_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 篩選跨境支付業務解款交易資料
# 檔案： VBA5.FX.S.IR.F2.DATA
# ==============
s_ir_f2_data_output() {
    echo "s_ir_f2_data_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBA5.FX.S.IR.F2.DATA
    "${STEP_DIR}"/daily-007-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_f2_data_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生長春集團「匯入匯款明細資料檔」
# 檔案： VBAN.FX.S.IR.CCPF1
# ==============
s_ir_ccpf1_output() {
    echo "s_ir_ccpf1_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAN.FX.S.IR.CCPF1
    "${STEP_DIR}"/daily-007-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_ccpf1_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生長春集團「匯入匯款明細資料檔」
# 檔案： VBAN.FX.S.IR.CCPF2
# ==============
s_ir_ccpf2_output() {
    echo "s_ir_ccpf2_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAN.FX.S.IR.CCPF2
    "${STEP_DIR}"/daily-007-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_ccpf2_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生長春集團「匯入匯款明細資料檔」
# 檔案： VBAN.FX.S.IR.CCPF3
# ==============
s_ir_ccpf3_output() {
    echo "s_ir_ccpf3_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAN.FX.S.IR.CCPF3
    "${STEP_DIR}"/daily-007-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_ccpf3_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生長春集團「匯入匯款明細資料檔」
# 檔案： VBAN.FX.S.IR.CCPF4
# ==============
s_ir_ccpf4_output() {
    echo "s_ir_ccpf4_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAN.FX.S.IR.CCPF4
    "${STEP_DIR}"/daily-007-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_ccpf4_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入日檔供外匯規劃部使用
# 檔案： VBAP.FX.S.IR.DAY.FTP091
# ==============
s_ir_day_ftp091_output() {
    echo "s_ir_day_ftp091_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAP.FX.S.IR.DAY.FTP091
    "${STEP_DIR}"/daily-007-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_day_ftp091_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入日檔供外匯規劃部使用
# 檔案： IRDATA_" REPORT-TODAY(7:2) ".TXT
# ==============
irdata_report_today_72_txt_output() {
    echo "irdata_report_today_7:2_txt_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/IRDATA_" REPORT-TODAY(7:2) ".TXT
    "${STEP_DIR}"/daily-007-fxdir00-job.sh "????"
    status=${?}
    echo "irdata_report_today_7:2_txt_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行日上下傳
# ==============
fxdir00_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        s_ir_dw_irmark_output
        s_ir_trn_tx411_output
        s_ir_trn_tx421_output
        s_ir_trn_tx441_output
        s_ir_trn_tx461_output
        s_ir_trn_tx471_output
        s_ir_trn_tx481_output
        s_ir_trn_tx491_output
        s_ir_trn_tx401_output
        s_ir_f1_data_output
        s_ir_f2_data_output
        s_ir_ccpf1_output
        s_ir_ccpf2_output
        s_ir_ccpf3_output
        s_ir_ccpf4_output
        s_ir_day_ftp091_output
        irdata_report_today_72_txt_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "s_ir_dw_irmark_output")
            s_ir_dw_irmark_output
            ;;
        "2" | "s_ir_trn_tx411_output")
            s_ir_trn_tx411_output
            ;;
        "3" | "s_ir_trn_tx421_output")
            s_ir_trn_tx421_output
            ;;
        "4" | "s_ir_trn_tx441_output")
            s_ir_trn_tx441_output
            ;;
        "5" | "s_ir_trn_tx461_output")
            s_ir_trn_tx461_output
            ;;
        "6" | "s_ir_trn_tx471_output")
            s_ir_trn_tx471_output
            ;;
        "7" | "s_ir_trn_tx481_output")
            s_ir_trn_tx481_output
            ;;
        "8" | "s_ir_trn_tx491_output")
            s_ir_trn_tx491_output
            ;;
        "9" | "s_ir_trn_tx401_output")
            s_ir_trn_tx401_output
            ;;
        "10" | "s_ir_f1_data_output")
            s_ir_f1_data_output
            ;;
        "11" | "s_ir_f2_data_output")
            s_ir_f2_data_output
            ;;
        "12" | "s_ir_ccpf1_output")
            s_ir_ccpf1_output
            ;;
        "13" | "s_ir_ccpf2_output")
            s_ir_ccpf2_output
            ;;
        "14" | "s_ir_ccpf3_output")
            s_ir_ccpf3_output
            ;;
        "15" | "s_ir_ccpf4_output")
            s_ir_ccpf4_output
            ;;
        "16" | "s_ir_day_ftp091_output")
            s_ir_day_ftp091_output
            ;;
        "17" | "irdata_report_today_72_txt_output")
            irdata_report_today_72_txt_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# fxdir00_main "${@}"

# ==============
