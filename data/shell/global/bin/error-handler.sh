#!/bin/bash

# 補充
# 可由命令列輸入參數，做為批次處理的參考
# 當有異常或執行失敗的情形，應以 System.exit 返回非 0 值
# 錯誤類型會由Framework對映到 job 狀態值
# BusinessException -> “1"
# ValidationException -> “2"
# ConnectionException -> “3"
# TransactionException -> “4"
# SystemException -> “5" 
# AP 指定 Retry -> “99”

# 原則大類是共用，以下示意先假設JAR_NOT_FOUND_RESULTCODE為99代表找不到JAR檔的result code
export JAR_NOT_FOUND_RESULTCODE=99

# chek status and exit
check_status_and_exit() {
    # 先用1離開當作接到非0值，模擬control-M只有接收成功(0)與失敗(非0)
    if [ ${1} -ne 0 ]; then
        exit ${1}
    fi

}

# check jar existence
check_jar_existence() {
    local jar_file_directory="${1}"
    if [ ! -f "${jar_file_directory}" ]; then
        echo "${jar_file_directory} not found"
        return ${JAR_NOT_FOUND_RESULTCODE}
    fi
}
