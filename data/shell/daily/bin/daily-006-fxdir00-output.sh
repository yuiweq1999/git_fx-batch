#!/bin/bash
# 每日批次作業：日報表 FXDIR00 -產出檔案作業
# 
# ==============

# resource
# ==============
source ./setdailyenv.sh
STEP_DIR='.'

# 環境變數
JOB_NAME="daily-006-fxdir00-output"
export JOB_NAME

# ==============

# 產生FS72國外匯入匯款收件明細表 
# 檔案： VBAM.FX.S.R.IR.FS72
# ==============
s_r_ir_fs72_output() {
    echo "s_r_ir_fs72_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAM.FX.S.R.IR.FS72
    "${STEP_DIR}"/daily-006-fxdir00-job.sh "????"
    status=${?}
    echo "s_r_ir_fs72_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FE10A國外費用及利息申報表
# 檔案： VBAM.FX.S.R.IR.FE10
# ==============
s_r_ir_fe10_output() {
    echo "s_r_ir_fe10_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAM.FX.S.R.IR.FE10
    "${STEP_DIR}"/daily-006-fxdir00-job.sh "????"
    status=${?}
    echo "s_r_ir_fe10_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS75,FS75B國外匯入匯款全行結帳表
# 檔案： VBAM.FX.S.R.IR.FS75
# ==============
s_r_ir_fs75_output() {
    echo "s_r_ir_fs75_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAM.FX.S.R.IR.FS75
    "${STEP_DIR}"/daily-006-fxdir00-job.sh "????"
    status=${?}
    echo "s_r_ir_fs75_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS62A，FS62B，FS67 列印銷帳檔未入帳明細表
# 檔案： VBAN.FX.S.IR.FS62.FTPDATA
# ==============
s_ir_fs62_ftpdata_output() {
    echo "s_ir_fs62_ftpdata_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAN.FX.S.IR.FS62.FTPDATA
    "${STEP_DIR}"/daily-006-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_fs62_ftpdata_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入匯款即遠期換匯交易 (SWAP) 明細，印製 <FZ06B>即期外匯尚未交割科目餘額表
# 檔案： VBAF.FX.S.IR.SWAP.FZ09
# ==============
s_ir_swap_fz09_output() {
    echo "s_ir_swap_fz09_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAF.FX.S.IR.SWAP.FZ09
    "${STEP_DIR}"/daily-006-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_swap_fz09_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生 <FZ07B> 即期未交割餘額核對表及即期外匯尚未交割科目餘額表
# 檔案： VBAM.FX.S.IR.NOTICE.FZ07
# ==============
s_ir_notice_fz07_output() {
    echo "s_ir_notice_fz07_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAM.FX.S.IR.NOTICE.FZ07
    "${STEP_DIR}"/daily-006-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_notice_fz07_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS66A,FS66B,FS68向國外求償差額明細表
# 檔案： VBAE.FX.S.IR.FS66
# ==============
s_ir_fs66_output() {
    echo "s_ir_fs66_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAE.FX.S.IR.FS66
    "${STEP_DIR}"/daily-006-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_fs66_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FS95系列國外匯入疑似化整為零案件日報表
# 檔案： VBAE.FX.S.IR.CHEAT.POOL
# ==============
s_ir_cheat_pool_output() {
    echo "s_ir_cheat_pool_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAE.FX.S.IR.CHEAT.POOL
    "${STEP_DIR}"/daily-006-fxdir00-job.sh "????"
    status=${?}
    echo "s_ir_cheat_pool_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============



# 執行日報表-產出檔案
# ==============
fxdir00_report_output_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        s_r_ir_fs72_output
        s_r_ir_fe10_output
        s_r_ir_fs75_output
        s_ir_fs62_ftpdata_output
        s_ir_swap_fz09_output
        s_ir_notice_fz07_output
        s_ir_fs66_output
        s_ir_cheat_pool_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "s_r_ir_fs72_output")
            s_r_ir_fs72_output
            ;;
        "2" | "s_r_ir_fe10_output")
            s_r_ir_fe10_output
            ;;
        "3" | "s_r_ir_fs75_output")
            s_r_ir_fs75_output
            ;;
        "4" | "s_ir_fs62_ftpdata_output")
            s_ir_fs62_ftpdata_output
            ;;
        "5" | "s_ir_swap_fz09_output")
            s_ir_swap_fz09_output
            ;;
        "6" | "s_ir_notice_fz07_output")
            s_ir_notice_fz07_output
            ;;
        "7" | "s_ir_fs66_output")
            s_ir_fs66_output
            ;;
        "8" | "s_ir_cheat_pool_output")
            s_ir_cheat_pool_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# fxdir00_report_output_main "${@}"

# ==============