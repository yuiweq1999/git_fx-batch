#!/bin/bash
# 每日批次作業：新核上傳會計檔作業 fxdac00
# 
# ==============

# resource
# ==============
source ./setdailyenv.sh
JAR_NAME="fir-batch-fxdac00"
JAR_FILE_DIRECTROY="${JOB_DIR}""${TARGET_DIR}"/"${JAR_NAME}.jar"

# 接usecase、參數
export USECASE="${1}"
shift
export ARGS=("$@")
# ==============

# 啟動模組
# ==============
run() {
    # 訪問環境變數
    local args=("${ARGS[@]}")

    # 必要參數:jar路徑、jvm起始值、Heap存放位置
    # java參數抽出去從dailysetenv共用，讓自己需要使用的設定可以額外自行加入
    # 例如：JAVA_OPTS="${JAVA_OPTS}  -Djava.security.egd=file:/dev/urandom"

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
# ==============

# 判斷jar檔是否存在
# ==============
check() {
    check_jar_existence "${JAR_FILE_DIRECTROY}"
}

# 執行會計job
# ==============
job_main() {
    echo "${JAR_NAME} ${ARGS}" 
    #check
    #run
}

job_main

# ==============
