#!/bin/bash
# 每月批次作業：月作業-下傳舊核 連線sftp

# 本地預設引用
source ./setmonthlyenv.sh
source ./monthly-sftp-setting1.sh

# control-M使用到的環境變數
GROUP_NAME="monthly-001-fxmmis-sftp"

# 從sftp接收匯入匯款 MIS 月損益資料檔 (須接收舊核產生之損益資料檔及調整兌換損益)
loss_sftp() {
    echo "loss_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    FILE_TO_TRANSFER="VMI0.MIS.S.IR.INT.LOSS"
    LOCAL_DIR="${INPUT_DIR}"/"${FILE_TO_TRANSFER}"
    sftp_transfer "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    status=${?}
    echo "loss_sftp result code:${status}"
    check_status_and_exit ${status}

}

# 從sftp接收匯入匯款 MIS 月損益資料檔 (須接收舊核產生之損益資料檔及調整兌換損益)
pool_sftp() {
    echo "pool_sftp start ${@}"
    REMOTE_DIR="/path/to/remote_directory"
    FILE_TO_TRANSFER="VMI0.MIS.S.UPD.INT.DAILY.POOL"
    LOCAL_DIR="${INPUT_DIR}"/"${FILE_TO_TRANSFER}"
    sftp_transfer "${USER}" "${HOST}" "${LOCAL_DIR}" "${REMOTE_DIR}" "${FILE_TO_TRANSFER}"
    status=${?}
    echo "pool_sftp result code:${status}"
    check_status_and_exit ${status}

}

# 執行sftp連線
fxmmis_sftp_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        loss_sftp
        pool_sftp
    else
        case "${1}" in
        "1" | "loss_sftp")
            loss_sftp
            ;;
        "2" | "pool_sftp")
            pool_sftp
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac

    fi
}
# 增加SIGINT信號，觸發時將終止程序
trap 'kill 0' SIGINT

# 測試
loss_sftp
# fxmmis_sftp_main "${@}"
