#!/usr/bin/env sh

update() {
  sketchybar --set $NAME label="$INFO"
}

TITLE=$(yabai -m query --windows --window | jq -r '.title')
sketchybar --set $NAME label="$TITLE"

