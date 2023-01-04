sketchybar --add item line right                                                     \
           --set line icon="]"                                                        \
                     icon.color=0xff9fd06a                                                 \
                     icon.font="Hack Nerd Font:Regular:14.8"                            \
                                                                                     \
           --add item playing right                                                \
           --set playing update_freq=5                                             \
                       icon.color=0xff9fd06a                                       \
                       label.font="$FONT:Medium:12.0"                                \
                       label.padding_right=10                                    \
                       label.color=0xffffffff                                      \
                       script="$PLUGIN_DIR/playing.sh"                                 \
                       label.y_offset=-1                                              \
                       background.padding_right=3                                   \
                       icon.font="Hack Nerd Font:Regular:14.8"                            \
