#!/usr/bin/env sh

args=()
if [ "$NAME" != "space_template" ]; then
  args+=(--set $NAME label=$NAME \
                     icon.highlight=$SELECTED)
fi

sketchybar -m --animate tanh 0 "${args[@]}"

if [ "$SELECTED" = "true" ]; then
  args+=(--set spaces_$DID.label label=${NAME#"spaces_$DID."} \
         --set $NAME icon.background.y_offset=0               )
fi

WIN=$(yabai -m query --spaces --space $SID | jq '.windows[0]')
HAS_WINDOWS_OR_IS_SELECTED="true"
if [ "$WIN" = "null" ] && [ "$SELECTED" = "false" ];then
  HAS_WINDOWS_OR_IS_SELECTED="false"
fi

if [ "$HAS_WINDOWS_OR_IS_SELECTED" = "true" ]; then
   icon=
   iconcolor=0xffcba5f7
else
   icon=
   iconcolor=0xffa7e3a1
fi

if [ "$SELECTED" = "true" ]; then
  icon=
fi


sketchybar --set $NAME icon.highlight=$SELECTED icon.color=$iconcolor icon=$icon
