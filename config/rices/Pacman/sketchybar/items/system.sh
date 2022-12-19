### cpu Widget ###
sketchybar --add item  cpu left                                                   \
           --set cpu   update_freq=10                                              \
                       icon.font="Font Awesome 6 Free:Solid:15.4"                  \
                       icon.padding_right=4                                        \
                       icon.color=0xfff6768e                                       \
                       icon.y_offset=1                                             \
                       label.font="$FONT:Regular:14.5"                                \
                       label.color=0xffdfe1ea                                      \
                       label.padding_right=8                                       \
                       background.color=0xff252731                                 \
                       background.height=33                                      \
                       background.corner_radius=20                                   \
                       background.padding_right=3                                  \
                       script="$PLUGIN_DIR/cpu.sh"                                 \
                       icon.padding_left=16 label.padding_right=16                   \

### mem Widget ###
sketchybar --add item  mem left                                                   \
           --set mem   update_freq=10                                              \
                       icon.font="Font Awesome 6 Free:Solid:15.4"                  \
                       icon.padding_right=4                                        \
                       icon.color=0xff4ed2e3                                       \
                       icon.y_offset=1                                              \
                       label.font="$FONT:Regular:14.5"                                \
                       label.color=0xffdfe1ea                                      \
                       label.padding_right=8                                       \
                       background.color=0xff252731                                 \
                       background.height=33                                      \
                       background.corner_radius=20                                   \
                       background.padding_right=3                                  \
                       script="$PLUGIN_DIR/mem.sh"                                 \
                       icon.padding_left=16 label.padding_right=16                   \

### ssd Widget ###
sketchybar --add item  ssd left                                                   \
           --set ssd   update_freq=10                                              \
                       icon.font="Font Awesome 6 Free:Solid:15.4"                  \
                       icon.padding_right=4                                        \
                       icon.color=0xfffbc02d                                       \
                       icon.y_offset=1                                              \
                       label.font="$FONT:Regular:14.5"                                \
                       label.color=0xffdfe1ea                                      \
                       label.padding_right=8                                       \
                       background.color=0xff252731                                 \
                       background.height=33                                      \
                       background.corner_radius=20                                   \
                       background.padding_right=3                                  \
                       script="$PLUGIN_DIR/disk.sh"                                 \
                       icon.padding_left=16 label.padding_right=16                   \
