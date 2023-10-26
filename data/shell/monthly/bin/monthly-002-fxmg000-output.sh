#!/bin/bash
# 每月批次作業：月作業-下傳舊核 FXMG000
#
# ==============

# resource
# ==============
source ./setmonthlyenv.sh
STEP_DIR='.'

# control-M使用到的環境變數
JOB_NAME="monthly-002-fxmg000-output"
export JOB_NAME
# ==============

# 下傳匯入資料供舊核產生境外客戶進出口業務統計表
# 檔案： xxxx
# ==============
xxxx_output() {
    echo "xxxx_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/xxxx
    "${STEP_DIR}"/monthly-002-fxmg000-job.sh "????"
    status=${?}
    echo "xxxx_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生 OBU_M_G1 資料檔所需資料
# 檔案： xxxxxx
# ==============
xxxxxx_output() {
    echo "xxxxxx_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/xxxxxx
    "${STEP_DIR}"/monthly-002-fxmg000-job.sh "????"
    status=${?}
    echo "xxxxxx_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FMB1資料檔所需資料
# 檔案： ????
# ==============
s_ir_log_dw_output() {
    echo "s_ir_log_dw_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/????
    "${STEP_DIR}"/monthly-002-fxmg000-job.sh "????"
    status=${?}
    echo "s_ir_log_dw_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 產生FMB8跨境貿易人民幣結算統計表、FYCNY3外匯指定銀行、FM31跨境貿易人民幣結算量統計表
# 檔案： ????
# ==============
s_i_output() {
    echo "s_i_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/????
    "${STEP_DIR}"/monthly-002-fxmg000-job.sh "????"
    status=${?}
    echo "s_i_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行fxmg000
# ==============
fxmg000_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
        xxxx_output
        xxxxxx_output
        s_ir_log_dw_output
        s_i_output
    else
        # 指定參數重跑
        case "${1}" in
        "1" | "xxxx_output")
            xxxx_output
            ;;
        "2" | "xxxxxx_output")
            xxxxxx_output
            ;;
        "3" | "s_ir_log_dw_output")
            s_ir_log_dw_output
            ;;
        "4" | "s_i_output")
            s_i_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# s_ir_log_dw_output
# fxmg000_main "${@}"

# ==============
