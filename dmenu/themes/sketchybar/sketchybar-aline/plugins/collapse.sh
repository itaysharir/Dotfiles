sketchybar --remove mem
sketchybar --remove cpu
sketchybar --remove disk
sketchybar --remove collapse

sketchybar --add item collapse right                                                \
           --set collapse icon=""                                                  \
                          icon.font="Font Awesome 6 Free:Solid:20.0"                \
                          icon.color=0xff47455c                                     \
                          icon.y_offset=-3                                          \
                          click_script="~/.config/sketchybar/plugins/expand.sh"
