#!/usr/bin/env sh

update() {
  sketchybar --set $NAME label="$INFO"
}

TITLE=$(yabai -m query --windows --window | jq -r '.title' | sed 's/\(.\{68\}\).*/\1.../')
sketchybar --set $NAME label="$TITLE"
