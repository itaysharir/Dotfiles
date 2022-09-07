#!/usr/bin/env bash

status=$(uptime | cut -d',' -f 1 | cut -d 'p' -f 2-)
uptime=$(echo $status)

sketchybar --set $NAME icon="􀁷" label="uptime: $uptime"
