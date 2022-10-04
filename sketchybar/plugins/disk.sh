#!/usr/bin/env sh

TOPPROC=$(df -h "/" | awk 'NR==2{print $4}' | cut -c 1-4)
sketchybar --set $NAME icon="" label="ssd: $TOPPROC free"
