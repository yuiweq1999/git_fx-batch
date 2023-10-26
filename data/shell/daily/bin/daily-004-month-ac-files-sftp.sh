#!/bin/bash
# 每日批次作業：月底接收舊核資料檔處理作業-連線sftp
#
# ==============

# resource
# ==============
source ./setdailyenv.sh
source ./monthly-sftp-setting1.sh

# control-M使用到的環境變數
JOB_NAME="daily-004-month-ac-files-sftp"
export JOB_NAME
# ==============

# job sftp
# ==============
exrtn_sftp() {
    echo "exrtn_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${INPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VAG0.AD.K.EXRT.N"
    sftp_transfer "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "exrtn_sftp result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行sftp連線
# ==============
ac_sftp_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        exrtn_sftp
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "exrtn_sftp")
            exrtn_sftp
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# exrtn_sftp
# ac_sftp_main "${@}"

# ==============
