#!/bin/bash
# 每日批次作業
source ./setreportenv.sh


GROUP_NAME="${GROUP_NAME} monthly-report-group"
export GROUP_NAME

# ====testA-step開始====
# 預防step位置異動，先設定起始位置
STEP_DIR='.'

drpt1() {
    # step1
    # step1專用的input,output
    export REPORT_INPUT="$INPUT_DIR"/
    export REPORT_OUTPUT="$OUTPUT_DIR"/
    "$STEP_DIR"/daily-report-job1.sh "dailyReportUseCaseImpl"
    status=$?
    echo "result test:$status"
    if [ $status -ne 0 ]; then
        exit $status
    fi
}

drpt2() {
    # step2
    # step2專用的input,output
    export REPORT_INPUT="$INPUT_DIR"/
    export REPORT_OUTPUT="$OUTPUT_DIR"/
    "$STEP_DIR"/weekly-report-job1.sh "weeklyReportUseCaseImpl"
    status=$?
    echo "result test:$status"
    if [ $status -ne 0 ]; then
        exit $status
    fi
}

drpt3() {
    # step3
    # step3專用的input,output
    export REPORT_INPUT="$INPUT_DIR"/
    export REPORT_OUTPUT="$OUTPUT_DIR"/
    "$STEP_DIR"/monthly-report-job1.sh "monthlyReportUseCaseImpl"
    status=$?
    echo "result test:$status"
    if [ $status -ne 0 ]; then
        exit $status
    fi
}

# todo:藉由接收到週、月、年營業日來確認是否要執行建立該週期的報表
getLastWorkday() {
    local last_weekly_workday=""
    local last_monthly_wokrday=""
    local last_yearly_workday=""

}

# 報表作業、批次作業、整檔作業作法：
# 模擬 判斷週月年,呼叫周月年的那隻jar ->跑 週 的那一段

main() {
    local args=("${@}") # 要傳給main的參數要存起來
    # 模擬Control-M指定重跑
    for arg in "${args[@]}"; do
        case "${arg}" in
        "1")
            drpt1
            ;;
        "2")
            drpt2
            ;;
        "3")
            drpt3
            ;;
        *)
            echo "unknown: ${arg}"
            exit 1
            ;;
        esac
    done
# 用0 1判斷是不是月底日(from ap程式)
# 假設是月底日 執行該週期的function()
# 所以應該是要 main() 週期 指定step {step需要的參數}

    if [ ${#args[@]} -eq 0 ]; then
        drpt1
        if [ -n "${last_weekly_workday}" ]; then
            drpt2
        else
            echo "Skipping step2 - No Weekly Workday available."
        fi
        if [ -n "${last_monthly_wokrday}" ]; then
            drpt3
        else
            echo "Skipping step3 - No Monthly Workday available."
        fi
    fi
}
# 增加SIGINT信號，觸發時將終止程序
trap 'kill 0' SIGINT
main "${@}"
