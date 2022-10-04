#!/usr/bin/env bash

status=$(boottime=`sysctl -n kern.boottime | awk '{print $4}' | sed 's/,//g'`
unixtime=`date +%s`
timeAgo=$(($unixtime - $boottime))
uptime=`awk -v time=$timeAgo 'BEGIN { minutes = int(time / 60 % 60); hours = int(time / 60 / 60 % 24); days = int(time / 60 / 60 / 24); printf("%.0fd %.0fh", days, hours); exit }'`
echo $uptime)
uptime=$(echo $status)

sketchybar --set $NAME icon="" label="uptime: $uptime"
