#!/bin/bash


single_instance() {
  local script_name=$(basename "$0")

  # 此處變數指定執行與直接執行指令會有不同
  # 變數指定執行會產生下列結果，因此需要判斷大於 2 的結果 
  # 304 76 0 17:00 tty2 00:00:00 /bin/bash ./daily-test.sh 
  # 306 304 0 17:00 tty2 00:00:00 /bin/bash ./daily-test.sh 
  local script_instance=$(ps -ef | grep "${script_name}" | grep -v grep | wc -l)
  if [ ${script_instance} -gt 2 ]; then
    echo -e "The ${script_name} already running!"
    exit 1
  fi
}

