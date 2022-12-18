status () {
  if spotify status | grep -q 'playing'; then
    echo "playing"
  else
    echo "paused"
  fi
}

BACK_SCRIPT="cd ~/.config/sketchybar/spotify && ./back.sh"
PAUSE_PLAY_SCRIPT="cd ~/.config/sketchybar/spotify/ && ./playpause.sh && source '$PLUGIN_DIR/spotify.sh'"
FORWARD_SCRIPT="cd ~/.config/sketchybar/spotify && ./forward.sh"

if [ $(status) = "playing" ]; then
  sketchybar --set pause icon=''
else
    sketchybar --set pause icon=''
fi
