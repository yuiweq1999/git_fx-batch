#!/bin/bash
# 每週批次作業：週作業-連線sftp
# 
# ==============

# resource
# ==============
source ./setweeklyenv.sh
source ./weekly-sftp-setting1.sh

# control-M使用到的環境變數
JOB_NAME="weekly-001-fxwir00-sftp"
export JOB_NAME
# ==============

# job sftp
# ==============
audit_sftp() {
    echo "audit_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    LOCAL_DIR="${INPUT_DIR}"/"${FILE_TO_TRANSFER}"
    FILE_TO_TRANSFER="VAU0.FX.S.IR.AUDIT"
    sftp_transfer "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    local status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}

# 執行sftp連線
# ==============
fxwir00_sftp_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        audit_sftp
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "audit_sftp")
            audit_sftp
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試單一step與sftp_main
# audit_sftp
# fxwir00_sftp_main "${@}"

# ==============