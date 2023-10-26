#!/bin/bash
# 每日批次作業：新核上傳會計檔作業
#
# resource
source ./setdailyenv.sh
source ./daily-004-fxdac00-output.sh
source ./daily-004-fxdg000-output.sh
source ./daily-004-fxdir00-output.sh
source ./daily-004-fxdn000-output.sh
source ./daily-004-fxd5320-output.sh
source ./daily-004-fxdu000-output.sh
source ./daily-004-fxdmis-output.sh
source ./daily-004-fxdg160-output.sh
source ./daily-004-fxdm010-output.sh
source ./daily-004-month-fxdg300-output.sh

source "${BASE_DIR}"/global/bin/parallel.sh
source "${BASE_DIR}"/global/bin/single-instance.sh

CWD=$(pwd)

# control-M使用到的環境變數
GROUP_NAME="daily-004-gen-ac-files-group"
export GROUP_NAME

# 日作業-下傳舊核(會計) 之 fxdac00
daily_fxdac00_output() {
    echo "daily_fxdac00_output start ${@}"

    fxdac00_main "${@}"

    local status=${?}
    echo "daily_fxdac00_output result code:${status}"
    check_status_and_exit ${status}
}

# 日作業-下傳舊核(會計) 之 fxdg000
daily_fxdg000_output() {
    echo "daily_fxdg000_output start ${@}"

    fxdg000_main "${@}"

    local status=${?}
    echo "daily_fxdg000_output result code:${status}"
    check_status_and_exit ${status}
}

# 日作業-下傳舊核(會計) 之 fxdir00
daily_fxdir00_output() {
    echo "daily_fxdir00_output start ${@}"

    fxdir00_main "${@}"

    local status=${?}
    echo "daily_fxdir00_output result code:${status}"
    check_status_and_exit ${status}
}

# 日作業-下傳舊核(會計) 之 fxdn000
daily_fxdn000_output() {
    echo "daily_fxdn000_output start ${@}"

    fxdn000_main "${@}"

    local status=${?}
    echo "daily_fxdn000_output result code:${status}"
    check_status_and_exit ${status}
}

# 日作業-下傳舊核(會計) 之 fxd5320
daily_fxd5320_output() {
    echo "daily_fxd5320_output start ${@}"

    fxd5320_main "${@}"

    local status=${?}
    echo "daily_fxd5320_output result code:${status}"
    check_status_and_exit ${status}
}

# 日作業-下傳舊核(會計) 之 fxdu000
daily_fxdu000_output() {
    echo "daily_fxdu000_output start ${@}"

    fxdu000_main "${@}"

    local status=${?}
    echo "daily_fxdu000_output result code:${status}"
    check_status_and_exit ${status}
}

# 日作業-下傳舊核(會計) 之 fxdmis
daily_fxdmis_output() {
    echo "daily_fxdmis_output start ${@}"

    fxdmis_main "${@}"

    local status=${?}
    echo "daily_fxdmis_output result code:${status}"
    check_status_and_exit ${status}
}

# 日作業-下傳舊核(會計) 之 fxdg160
daily_fxdg160_output() {
    echo "daily_fxdg160_output start ${@}"

    fxdg160_main "${@}"

    local status=${?}
    echo "daily_fxdg160_output result code:${status}"
    check_status_and_exit ${status}
}

# 日作業-下傳舊核(會計) 之 fxdm010
daily_fxdm010_output() {
    echo "daily_fxdm010_output start ${@}"

    fxdm010_main "${@}"

    local status=${?}
    echo "daily_fxdm010_output result code:${status}"
    check_status_and_exit ${status}
}

# 月作業-下傳舊核(會計) 之 fxdg300
daily_month_fxdg300_output() {
    echo "monthly_fxdg300_output start ${@}"

    fxdg300_main "${@}"

    local status=${?}
    echo "monthly_fxdg300_output result code:${status}"
    check_status_and_exit ${status}
}

daily_sequential_run() {
    daily_fxdac00_output
    daily_fxdg000_output
    daily_fxdir00_output
    daily_fxdn000_output
    daily_fxd5320_output
    daily_fxdu000_output
    daily_fxdmis_output
    daily_fxdg160_output
    daily_fxdm010_output
}

daily_parallel_run() {
    clear_parallel_jobs
    parallel daily_fxdac00_output
    parallel daily_fxdg000_output
    parallel daily_fxdir00_output
    parallel daily_fxdn000_output
    parallel daily_fxd5320_output
    parallel daily_fxdu000_output
    parallel daily_fxdmis_output
    parallel daily_fxdg160_output
    parallel daily_fxdm010_output

    wait_and_check_parallel
    local status=${?}
    echo "daily_004 parallel result code:${status}"
    check_status_and_exit ${status}
}

monthly_sequential_run() {
    daily_month_fxdg300_output
}

monthly_parallel_run() {
    clear_parallel_jobs
    parallel daily_month_fxdg300_output

    wait_and_check_parallel
    local status=${?}
    echo "daily_month_fxdg300_output parallel result code:${status}"
    check_status_and_exit ${status}
}

# 判斷是否為月底日
END_DAY_OF_MONTH=0
is_end_day_of_month() {
    echo "is_end_day_of_month start"
    #TODO 待置入判斷 step
    END_DAY_OF_MONTH=1
    echo "is_end_day_of_month result code:${END_DAY_OF_MONTH}"
}

group_main() {

    # 檢查重複執行
    single_instance

    # Control-M指定重跑
    if [ $# -eq 0 ]; then

        daily_parallel_run

        is_end_day_of_month
        if [ ${END_DAY_OF_MONTH} -eq 1 ]; then
            monthly_parallel_run
        fi
    else
        case "${1}" in
        "1" | "daily_fxdac00_output")
            daily_fxdac00_output ${2}
            ;;
        "2" | "daily_fxdg000_output")
            daily_fxdg000_output ${2}
            ;;
        "3" | "daily_fxdir00_output")
            daily_fxdir00_output ${2}
            ;;
        "4" | "daily_fxdn000_output")
            daily_fxdn000_output ${2}
            ;;
        "5" | "daily_fxd5320_output")
            daily_fxd5320_output ${2}
            ;;
        "6" | "daily_fxdu000_output")
            daily_fxdu000_output ${2}
            ;;
        "7" | "daily_fxdmis_output")
            daily_fxdmis_output ${2}
            ;;
        "8" | "daily_fxdg160_output")
            daily_fxdg160_output ${2}
            ;;
        "9" | "daily_fxdm010_output")
            daily_fxdm010_output ${2}
            ;;
        "10" | "daily_month_fxdg300_output")
            daily_month_fxdg300_output ${2}
            ;;
        *)
            echo "unknown: '${1}' "
            exit 1
            ;;
        esac
    fi
}
# 增加SIGINT信號，觸發時將終止程序
trap 'kill 0' SIGINT
group_main "${@}"
