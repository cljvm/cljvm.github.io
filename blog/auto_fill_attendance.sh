#!/bin/bash
if [ -z "$1" ] ;then
    start_date=`date -d "now" "+%Y-%m-%d"`
else
    start_date="$1"
fi
end_date=`date -d "$start_date +1 month" "+%Y-%m-%d"`
start_sec=`date -d "$start_date" +"%s"`
end_sec=`date -d "$end_date" +"%s"`
interval_sec=$[$end_sec-$start_sec]
interval_day=$[$interval_sec/86400]

employeeId="9997"
projId="4290"
taskId="36254"
workTime="8"
desc="具体内容"

for i in `seq 1 $interval_day`; do
    today=`date -d "$start_date +$[$i-1] day" "+%Y-%m-%d"`
    week_day=`date -d "$today" "+%w"`
    if [[ $week_day -gt 0 && $week_day -lt 6 ]]; then
        curl -d "timeEntryDate=$today&totalTime=$workTime&description=$(echo -e $desc)&accountProjectId=$projId&accountProjectTaskId=$taskId&accountEmployeeTimeEntryId=0&accountEmployeeId=$employeeId&action=save&submitted=1&accountWorkTypeId=52&isWeChat=true" "http://pm.git.com.cn/weixin_qyh/ashx/AccountEmployeeTimeEntry.ashx"
        sleep 1s
    fi
done
