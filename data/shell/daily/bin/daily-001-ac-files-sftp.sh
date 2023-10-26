#!/bin/bash
# 每日批次作業：接收舊核資料檔處理作業-連線sftp
# 
# ==============

# resource
# ==============
source ./setdailyenv.sh
source ./daily-sftp-setting1.sh

# control-M使用到的環境變數
JOB_NAME="daily-001-ac-files-sftp"
export JOB_NAME
# ==============

# job sftp
# ==============
fxtrn_sftp() {
    echo "fxtrn_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${INPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBAR.FX.K.LINE.FXTRN"
    sftp_transfer "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}

bu00_sftp() {
    echo "bu00_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="$INPUT_DIR"/"$FILE_TO_TRANSFER"
    FILE_TO_TRANSFER="VBAR.FX.K.LINE.SUM.BU00"
    sftp_transfer "$USER" "$HOST" "$LOCAL_DIR" "$REMOTE_DIR" "$FILE_TO_TRANSFER"
    local status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}

mast_sftp() {
    echo "mast_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="$INPUT_DIR"/"$FILE_TO_TRANSFER"
    FILE_TO_TRANSFER="VBAR.FX.K.FX.RATE.MAST"
    sftp_transfer "$USER" "$HOST" "$LOCAL_DIR" "$REMOTE_DIR" "$FILE_TO_TRANSFER"
    local status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}

prno2_sftp() {
    echo "prno2_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="$INPUT_DIR"/"$FILE_TO_TRANSFER"
    FILE_TO_TRANSFER="VBA6.FX.K.OUTREMIT.PRNO2"
    sftp_transfer "$USER" "$HOST" "$LOCAL_DIR" "$REMOTE_DIR" "$FILE_TO_TRANSFER"
    local status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}

acct_sftp() {
    echo "acct_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="$INPUT_DIR"/"$FILE_TO_TRANSFER"
    FILE_TO_TRANSFER="VBA3.FX.K.OR.CHEAT.ACCT"
    sftp_transfer "$USER" "$HOST" "$LOCAL_DIR" "$REMOTE_DIR" "$FILE_TO_TRANSFER"
    local status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}

post_sftp() {
    echo "post_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="$INPUT_DIR"/"$FILE_TO_TRANSFER"
    FILE_TO_TRANSFER="VBA3.FX.K.POST"
    sftp_transfer "$USER" "$HOST" "$LOCAL_DIR" "$REMOTE_DIR" "$FILE_TO_TRANSFER"
    local status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}

olrt_sftp() {
    echo "olrt_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="$INPUT_DIR"/"$FILE_TO_TRANSFER"
    FILE_TO_TRANSFER="VAG0.AD.K.OLRT"
    sftp_transfer "$USER" "$HOST" "$LOCAL_DIR" "$REMOTE_DIR" "$FILE_TO_TRANSFER"
    local status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}
# ==============

# 執行sftp連線
# ==============
ac_sftp_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        fxtrn_sftp
        bu00_sftp
        mast_sftp
        prno2_sftp
        acct_sftp
        post_sftp
        olrt_sftp
    else
        # 指定參數重跑
        case "${1}" in
        "fxtrn_sftp")
            fxtrn_sftp
            ;;
        "bu00_sftp")
            bu00_sftp
            ;;
        "mast_sftp")
            mast_sftp
            ;;
        "prno2_sftp")
            prno2_sftp
            ;;
        "acct_sftp")
            acct_sftp
            ;;        
        "post_sftp")
            post_sftp
            ;;
        "olrt_sftp")
            olrt_sftp
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試單一step與sftp_main
# fxtrn_sftp
# ac_sftp_main "${@}"

# ==============