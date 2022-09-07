#!/usr/bin/env bash

getPrecentage=$(TARGET_PATH="."
top -l 1 | grep -E "^CPU" | grep -Eo '[^[:space:]]+%' | head -1)

getMB=$(TARGET_PATH="."
top -l1 | awk '/PhysMem/ {print $2}')

precentage=$(echo $getPrecentage)
MB=$(echo $getMB)

sketchybar --set $NAME icon="" label="mem: $MB ($precentage)"
