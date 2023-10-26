#!/bin/bash
# 每日批次作業：循序型的範例
source ./setdailyenv.sh

GROUP_NAME="daily-example-group"
export GROUP_NAME

# ====testA-step開始====
# 預防step位置異動，先設定起始位置
STEP_DIR='.'

dstep1() {
    # step1
    # step1專用的input,output
    echo "step1 start"
    export INPUT_FM04AUSECASE2="$INPUT_DIR"/
    export OUTPUT_FM04AUSECASE2="$OUTPUT_DIR"/
    "${STEP_DIR}"/daily-example-job1.sh "createCustomerUseCaseImpl"
    status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}

dstep2() {
    # step2
    # step2專用的input,output
    echo "step2 start"
    export INPUT_FM04AUSECASE2="$INPUT_DIR"/
    export OUTPUT_FM04AUSECASE2="$OUTPUT_DIR"/
    "${STEP_DIR}"/daily-example-job1.sh "createCustomerUseCaseImpl"
    status=${?}
    echo "result code:${status}"
    check_status_and_exit ${status}
}

dstep3() {
    # step3
    echo "step3 start"
    "${STEP_DIR}"/daily-example-job1.sh "createCustomerUseCaseImpl"
    local status=${?}
    echo "result code:${status}"
    echo "step3 finish"
    check_status_and_exit ${status}

}

main() {
    local args=("${@}") # 要傳給main的參數要存起來
    # 模擬Control-M指定重跑
    for arg in "${args[@]}"; do
        case "${arg}" in
        "1")
            dstep1
            ;;
        "2")
            dstep2
            ;;
        "3")
            dstep3
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    done

    if [ ${#args[@]} -eq 0 ]; then
        dstep1
        dstep2
        dstep3
    fi
}
# 增加SIGINT信號，觸發時將終止程序
trap 'kill 0' SIGINT
main "$@"
