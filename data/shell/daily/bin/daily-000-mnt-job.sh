#!/bin/bash
# 每日批次作業job：維護作業

source ./setdailyenv.sh

# 接usecase、參數
export USECASE="${1}"
shift
export ARGS=("$@")

# 啟動模組
run() {
    # 訪問環境變數
    local args=("${ARGS[@]}")

    # java啟動
    local now=$(date)
    echo $now $0 "start"

    # 執行JAVA
    java -cp "${JAR_FILE_DIRECTROY}" ${JAVA_OPTS} -jar "${JAR_FILE_DIRECTROY}" "${USECASE}" "${args[@]}"

    # 接收JAVA狀態碼
    local status=${?}
    local now=$(date)
    echo ${now} ${0} "end,result:${status}"
    return ${status}

}

main() {
    run
}

main
