#!/bin/bash
# 每月批次作業：月作業-下傳舊核 FXMIR00
#
# ==============

# resource
# ==============
source ./setmonthlyenv.sh
STEP_DIR='.'

# control-M使用到的環境變數
JOB_NAME="monthly-002-fxmir00-output"
export JOB_NAME
# ==============

# 產生業務量承作表及累進分行承作量檔
# 檔案： xxxx
# ==============
xxxx_output() {
    echo "xxxx_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/xxxx
    "${STEP_DIR}"/monthly-002-fxmir00-job.sh "????"
    status=${?}
    echo "xxxx_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# # 產生業務量承作表及累進分行承作量檔
# 檔案： VBAM.FX.S.A.PRO.FS84
# ==============
s_a_pro_fs84_output() {
    echo "s_a_pro_fs84_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAM.FX.S.A.PRO.FS84
    "${STEP_DIR}"/monthly-002-fxmir00-job.sh "????"
    status=${?}
    echo "s_a_pro_fs84_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入顧客貢獻額資料檔
# 檔案： VBA1.FX.S.IR.CNTRIBUT
# ==============
s_ir_cntribut_output() {
    echo "s_ir_cntribut_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBA1.FX.S.IR.CNTRIBUT
    "${STEP_DIR}"/monthly-002-fxmir00-job.sh "????"
    status=${?}
    echo "s_ir_cntribut_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生各項保費及手續費資料檔及FS67報表，因須合併匯出資料，故此作業由新核產生資料後下傳至舊核繼續作業
# 檔案： VBAN.FX.S.MIS.IR.HANDLE.FEE
# ==============
s_mis_ir_handle_fee_output() {
    echo "s_mis_ir_handle_fee_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAN.FX.S.MIS.IR.HANDLE.FEE
    "${STEP_DIR}"/monthly-002-fxmir00-job.sh "????"
    status=${?}
    echo "s_mis_ir_handle_fee_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生各項保費及手續費資料檔及FS67報表，因須合併匯出資料，故此作業由新核產生資料後下傳至舊核繼續作業
# 檔案： VBAN.FX.S.MIS.IR.HANDLE.DETAIL
# ==============
s_mis_ir_handle_detail_output() {
    echo "s_mis_ir_handle_detail_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAN.FX.S.MIS.IR.HANDLE.DETAIL
    "${STEP_DIR}"/monthly-002-fxmir00-job.sh "????"
    status=${?}
    echo "s_mis_ir_handle_detail_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生匯入臨櫃、自動化交易筆數
# 檔案： VBAM.FX.S.IR.TXN.CNT.MONTH
# ==============
s_ir_txn_cnt_month_output() {
    echo "s_ir_txn_cnt_month_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAM.FX.S.IR.TXN.CNT.MONTH
    "${STEP_DIR}"/monthly-002-fxmir00-job.sh "????"
    status=${?}
    echo "s_ir_txn_cnt_month_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行fxmir00
# ==============
fxmir00_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        xxxx_output
        s_a_pro_fs84_output
        s_ir_cntribut_output
        s_mis_ir_handle_fee_output
        s_mis_ir_handle_detail_output
        s_ir_txn_cnt_month_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "xxxx_output")
            xxxx_output
            ;;
        "2" | "s_a_pro_fs84_output")
            s_a_pro_fs84_output
            ;;
        "3" | "s_mis_ir_handle_fee_output")
            s_mis_ir_handle_fee_output
            ;;
        "4" | "s_mis_ir_handle_detail_output")
            s_mis_ir_handle_detail_output
            ;;
        "5" | "s_ir_txn_cnt_month_output")
            s_ir_txn_cnt_month_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# xxxx_output
# fxmir00_main "${@}"

# ==============
