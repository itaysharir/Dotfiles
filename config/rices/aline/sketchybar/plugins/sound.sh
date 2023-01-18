#!/usr/bin/env bash

VOLUME=$(osascript -e "output volume of (get volume settings)")
MUTED=$(osascript -e "output muted of (get volume settings)")

if [[ $MUTED != "false" ]]; then
ICON="▰▰▰▰▰"
LABEL="▰▰"
else
case ${VOLUME} in
  100) ICON="▰▰▰▰▰▰▰";;
  9[0-9]) ICON="▰▰▰▰▰▰▰"; LABEL="";;
  8[0-9]) ICON="▰▰▰▰▰▰▰"; LABEL="";;
  7[0-9]) ICON="▰▰▰▰▰"; LABEL="▰▰";;
  6[0-9]) ICON="▰▰▰▰▰"; LABEL="▰▰";;
  5[0-9]) ICON="▰▰▰"; LABEL="▰▰▰▰";;
  4[0-9]) ICON="▰▰▰"; LABEL="▰▰▰▰";;
  3[0-9]) ICON="▰▰"; LABEL="▰▰▰▰▰";;
  2[0-9]) ICON="▰▰"; LABEL="▰▰▰▰▰";;
  1[0-9]) ICON="▰▰"; LABEL="▰▰▰▰▰";;
  [0-9]) ICON="▰"; LABEL="▰▰▰▰▰▰";;
  *) ICON="▰▰▰▰▰▰▰"
esac
fi

sketchybar -m \
--set $NAME icon=$ICON \
--set $NAME label="$LABEL"
