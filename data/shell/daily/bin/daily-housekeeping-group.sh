#!/bin/bash
# 每日批次作業
source ./sethousekeepingenv.sh

GROUP_NAME="${GROUP_NAME} daily-housekeeping-group"
export GROUP_NAME


# ====testA-step開始====
# 預防step位置異動，先設定起始位置
STEP_DIR='.'

dhouse() {
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

main() {
    local args=("${@}") # 要傳給main的參數要存起來
    for arg in "${args[@]}"; do
        case "${arg}" in
        "1")
            dhouse
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    done

    if [ ${#args[@]} -eq 0 ]; then
        dhouse
    fi
}
# 增加SIGINT信號，觸發時將終止程序
trap 'kill 0' SIGINT
main "$@"