sketchybar --add item battery right                                                 \
           --set battery update_freq=1                                           \
                       icon.font="Font Awesome 6 Free:Solid:20.0"                  \
                       icon.padding_right=4                                        \
                       icon.color=0xffa7e3a1                                       \
                       icon.y_offset=1                                              \
                       label.font="$FONT:Medium:19.0"                                \
                       label.color=0xff47455c                                      \
                       icon.y_offset=-3                                             \
                       label.y_offset=-3                                        \
                       script="$PLUGIN_DIR/battery.sh"                                 \
