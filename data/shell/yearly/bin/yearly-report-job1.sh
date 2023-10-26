#!/bin/bash
# 每日批次作業job1：執行jar的shell

source ./setdailyenv.sh
JAR_NAME='fir-batch-example-14.0.0-SNAPSHOT.jar'
JAR_DIR="$JOB_DIR"/"$TARGET_DIR"/"$JAR_NAME"

# 接usecase、參數
export USECASE="$1" 
shift
export ARGS=("$@")

# 啟動模組
run_jar() {
    # 訪問環境變數
    local usecase="$USECASE"
    local args=("${ARGS[@]}")
    local spring_profile="$SPRING_PROFILE"


    # 必要參數:jar路徑、jvm起始值、Heap存放位置
    local jar="$JAR_DIR"
    local java_opts="-Xms256m -Xmx1024m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp"
    local spring_admin_enabled="-Dspring.application.admin.enabled=false"
    local file_encoding="-Dfile.encoding=UTF8"
    local java_headless="-Djava.awt.headless=true"
    local java_egd="-Djava.security.egd=file:/dev/urandom"

    # 判斷jar檔是否存在
    if  [ ! -f $JAR_DIR ]; then
        echo $JAR_DIR "not found"
        return $JAR_NOT_FOUND_RESULTCODE
    fi

    # java啟動
    local classpath="$JAR_DIR"
    now=$(date)
    echo $now $0 "start"
    
    # 執行JAVA
    java \
        -cp "$classpath" \
        -Dspring.profiles.active="$spring_profile" \
        $spring_admin_enabled \
        $file_encoding \
        $java_headless \
        $java_egd \
        $java_opts \
        -jar "$jar" "$usecase" "${args[@]}" ; status=$?

    # 接收JAVA狀態碼
    now=$(date)
    echo $now $0 "end,result:$status"
    return $status
    
}

# 調用 run_jar
run_jar