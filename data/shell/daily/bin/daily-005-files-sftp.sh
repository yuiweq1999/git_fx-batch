#!/bin/bash
# 每日批次作業：日作業-下傳舊核-連線sftp
# 
# ==============

# resource
# ==============
source ./setdailyenv.sh
source ./daily-sftp-setting1.sh

# control-M使用到的環境變數
JOB_NAME="daily-004-files-sftp"
export JOB_NAME
# ==============

# 產生伊朗匯入匯款資料
# 檔案： VBA6.FX.S.IR.IRAN
# ==============
ir_iran_sftp() {
    echo "ir_iran_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBA6.FX.S.IR.IRAN"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}

# 產生伊朗匯入匯款資料
# 檔案： VBA6.FX.S.IR.IRAN.OTHER
# ==============
ir_iran_other_sftp() {
    echo "ir_iran_other_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${OUTPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VBA6.FX.S.IR.IRAN.OTHER"
    transfer_to_sftp "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "ir_iran_other_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行sftp連線
# ==============
common_files_sftp_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        ir_iran_sftp
        ir_iran_other_sftp
    else
        # 指定參數重跑
        case "${1}" in
        "ir_iran_sftp")
            ir_iran_sftp
            ;;
        "ir_iran_other_sftp")
            ir_iran_other_sftp
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試單一step與sftp_main
# ir_iran_sftp
common_files_sftp_main "${@}"

# ==============