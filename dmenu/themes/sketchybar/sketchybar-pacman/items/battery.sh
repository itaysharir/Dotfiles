sketchybar --add item battery right                                                 \
           --set battery update_freq=1                                           \
                       icon.font="Font Awesome 6 Free:Solid:15.4"                  \
                       icon.padding_right=4                                        \
                       icon.color=0xff9ac868                                       \
                       icon.y_offset=1                                              \
                       label.font="$FONT:Regular:14.5"                                \
                       label.color=0xffdfe1ea                                      \
                       label.padding_right=8                                       \
                       background.color=0xff252731                                 \
                       background.height=33                                      \
                       background.corner_radius=20                                   \
                       background.padding_right=3                                  \
                       script="$PLUGIN_DIR/battery.sh"                                 \
                       icon.padding_left=16 label.padding_right=16                   \
