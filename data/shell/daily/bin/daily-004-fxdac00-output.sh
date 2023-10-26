#!/bin/bash
# 每日批次作業：日作業-下傳舊核(會計) FXDAC00
# 
# ==============

# resource
# ==============
source ./setdailyenv.sh
source "${BASE_DIR}"/global/bin/parallel.sh

STEP_DIR='.'

# 環境變數
JOB_NAME="daily-004-fxdac00-output"
export JOB_NAME

# ==============

# 計算匯入求償各幣別本日餘額 , 產生匯入求償過渡傳票檔
# 檔案： VBAM.FX.K.IR.NODY.TRN.DS
# ==============
ir_nody_trn_ds_output() {
    echo "ir_nody_trn_ds_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAM.FX.K.IR.NODY.TRN.DS
    "${STEP_DIR}"/daily-004-fxdac00-job.sh "????"
    status=${?}
    echo "ir_nody_trn_ds_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 計算匯入求償各幣別本日餘額 , 產生匯入求償過渡傳票檔
# 檔案： VBAM.FX.S.IR.TX431.VOC
# ==============
ir_tx431_voc_output() {
    echo "ir_nody_trn_ds_output start ${@}"
    export OUTPUT_FILE="$OUTPUT_DIR"/VBAM.FX.S.IR.TX431.VOC
    "${STEP_DIR}"/daily-004-fxdac00-job.sh "????"
    status=${?}

    # for test
    sleep 10
    #status=1
    
    echo "ir_nody_trn_ds_output result code:${status}"
    check_status_and_exit ${status}
}

# ==============

# 執行下傳舊核(會計) FXDAC00
# ==============
fxdac00_main() {
    # 不提供參數直接依序執行
    if [ $# -eq 0 ]; then
       ir_nody_trn_ds_output
       ir_tx431_voc_output
       
    else
        # 指定參數重跑
        case "${1}" in
        "1")
            ir_nody_trn_ds_output
            ;;
        "2")
            ir_tx431_voc_output
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    fi

}

# 測試
# fxdac00_main

# ==============