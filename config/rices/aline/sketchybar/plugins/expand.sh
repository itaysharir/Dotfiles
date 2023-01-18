sketchybar --remove collapse

sketchybar --add item  mem right                                                   \
           --set mem   update_freq=10                                              \
                       icon.font="Font Awesome 6 Free:Solid:15.4"                  \
                       icon.padding_right=4                                        \
                       icon.color=0xfff5c1e6                                       \
                       icon.y_offset=-3                                              \
                       label.y_offset=-3                                              \
                       label.font="Inconsolata:Medium:19.0"                                \
                       label.color=0xff47455c                                      \
                       label.padding_right=8                                       \
                       background.drawing=on                                        \
                       background.color=0xfff4f5f8                                  \
                       script="~/.config/sketchybar/plugins/mem.sh"                                 \

### cpu Widget ###
sketchybar --add item  cpu right                                                   \
           --set cpu   update_freq=10                                              \
                       icon.font="Font Awesome 6 Free:Solid:15.4"                  \
                       icon.padding_right=4                                        \
                       icon.color=0xffedd6a4                                       \
                       icon.y_offset=-3                                              \
                       label.y_offset=-3                                              \
                       label.font="Inconsolata:Medium:19.0"                                \
                       label.color=0xff47455c                                      \
                       label.padding_right=8                                       \
                       background.drawing=on                                        \
                       background.color=0xfff4f5f8                                  \
                       script="~/.config/sketchybar/plugins/cpu.sh"                                 \
### ssd Widget ###
sketchybar --add item  disk right                                                   \
           --set disk  update_freq=10                                              \
                       icon.font="Font Awesome 6 Free:Solid:15.4"                  \
                       icon.padding_right=4                                        \
                       icon.color=0xfff37ea0                                       \
                       icon.y_offset=-3                                              \
                       label.y_offset=-3                                              \
                       label.font="Inconsolata:Medium:19.0"                                \
                       label.color=0xff47455c                                      \
                       label.padding_right=8                                       \
                       background.drawing=on                                        \
                       background.color=0xfff4f5f8                                  \
                       script="~/.config/sketchybar/plugins/disk.sh"                                 \

sketchybar --add item collapse right                                                \
           --set collapse icon=""                                                  \
                          icon.font="Font Awesome 6 Free:Solid:20.0"                \
                          icon.color=0xff47455c                                     \
                          icon.y_offset=-3                                          \
                          click_script="~/.config/sketchybar/plugins/collapse.sh"

sketchybar --update
