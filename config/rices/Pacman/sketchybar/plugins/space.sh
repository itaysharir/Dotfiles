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
   icon=
   iconfont="Font Awesome 6 Free:Solid:15.0"
   offset="1"
   iconcolor=0xff7aa1f7
else
   icon=⬤
   iconcolor=0xff583794
fi

if [ "$SELECTED" = "true" ]; then
  icon=
  iconfont="Pacman-Dots:Regular:15.5"
  offset="1"
fi


sketchybar --set $NAME icon.highlight=$SELECTED icon.y_offset=$offset icon.font="$iconfont" icon.color=$iconcolor icon=$icon
