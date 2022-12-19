OUTDATED=$(brew outdated | grep . -c)

sketchybar --set $NAME label="$OUTDATED"
