#!/usr/bin/env sh

update() {
  sketchybar --set $NAME label="$INFO"
}

TITLE=$(yabai -m query --windows --window | jq -r '.title' | sed 's/\(.\{55\}\).*/\1.../')
sketchybar --set $NAME label="$TITLE"
