#!/bin/bash
# BASE_DIR必須更換
export BASE_DIR="../.."
source "${BASE_DIR}"/global/bin/fx.sh

# JOB路徑，由BASE_DIR組成，再提供固定位置(此處為指定target資料夾位置)
export JOB_DIR=".."
export TARGET_DIR="/target/fir-batch-example-job1"

# INPUT、OUTPUT路徑，由服務內部提供指定變數(yaml)，shell負責提供資料夾路徑
export INPUT_DIR="${BASE_DIR}"/weekly/input
export OUTPUT_DIR="${BASE_DIR}"/weekly/output

# sftp
source "$BASE_DIR"/global/bin/sftp.sh

# error_handler，這邊是因為這一支剛好是全部都可以共用的基本檢查，實際上若有AP自己使用的來源可以不必放在這個位置
source "$BASE_DIR"/global/bin/error-handler.sh

# daily-java參數
# java_opts="-Xms256m -Xmx1024m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp"
# spring_admin_enabled="-Dspring.application.admin.enabled=false"
# file_encoding="-Dfile.encoding=UTF8"
# java_headless="-Djava.awt.headless=true"
# java_egd=""

# 增加必要使用的參數，以變量替換方式提供
JAVA_OPTS="${JAVA_OPTS} -Dspring.profiles.active=$SPRING_PROFILE"
# 增加java執行所需要的預設虛擬機初始值、內存溢出錯誤(OutOfMemoryError)生成Heap Dump(生成堆轉儲)與Heap Dump位置
JAVA_OPTS="${JAVA_OPTS} -Xms256m -Xmx1024m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp"
# 禁用Spring Boot Admin Server，減少資源浪費
JAVA_OPTS="${JAVA_OPTS} -Dspring.application.admin.enabled=false"
# 檔案的預設編碼
JAVA_OPTS="${JAVA_OPTS} -Dfile.encoding=UTF8"
# 預設啟動無圖形介面設備下，可以讓Java的awt啟用無圖形介面功能
JAVA_OPTS="${JAVA_OPTS} -Djava.awt.headless=true"
# 指定linux隨機生成器的來源使用urandom，避免較舊版linux使用random時出現不必要的延遲
JAVA_OPTS="${JAVA_OPTS} -Djava.security.egd=file:/dev/urandom"

export JAVA_OPTS
