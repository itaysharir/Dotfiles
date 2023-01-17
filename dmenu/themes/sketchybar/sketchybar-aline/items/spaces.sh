#!/usr/bin/env sh

export SPACE_CLICK_SCRIPT="yabai -m space --focus \$SID 2>/dev/null"

sketchybar --add   space          space_template left                \
           --set   space_template icon.color=0xffa7e3a1               \
                                  icon.highlight_color=0xff86b2fa    \
                                  label.drawing=off                  \
                                  drawing=on                        \
                                  updates=on                         \
                                  associated_display=1               \
                                  y_offset=-3                   \
                                  label.font="$FONT:Black:10.0"      \
                                  icon.font="Font Awesome 6 Free:Solid:17.5"        \
                                  click_script="$SPACE_CLICK_SCRIPT" \
                                  ignore_association=on              \
                                  background.padding_left=1         \
                                                                     \
           --clone spaces_1.idle  space_template                     \
           --set   spaces_1.idle  associated_space=1                 \
                                  icon=                            \
                                  script="$PLUGIN_DIR/space.sh"      \
                                  icon.padding_left=8               \
                                                                     \
           --clone spaces_1.misc  space_template                     \
           --set   spaces_1.misc  associated_space=2                 \
                                  icon=                           \
                                  script="$PLUGIN_DIR/space.sh"      \
                                                                     \
           --clone spaces_1.doc   space_template                     \
           --set   spaces_1.doc   associated_space=3                 \
                                  icon=                           \
                                  drawing=on                         \
                                  script="$PLUGIN_DIR/space.sh"      \
                                                                     \
           --clone spaces_1.help  space_template                     \
           --set   spaces_1.help  associated_space=4                 \
                                  icon=                           \
                                  script="$PLUGIN_DIR/space.sh"      \
                                                                     \
           --clone spaces_1.music space_template                     \
           --set   spaces_1.music associated_space=5                 \
                                  icon=                           \
                                  script="$PLUGIN_DIR/space.sh"      \
                                                                        \
           --clone spaces_2.nine  space_template                     \
           --set   spaces_2.nine  associated_space=6                 \
                                  icon=                          \
                                  script="$PLUGIN_DIR/space.sh"      \
                                  icon.padding_right=0               \
                                                                     \
           --add   bracket        spaces_1                           \
                                  spaces_1.label                     \
                                  spaces_1.idle                      \
                                  spaces_1.misc                      \
                                  spaces_1.doc                       \
                                  spaces_1.help                      \
                                  spaces_1.music                     \
                                  spaces_1.nine                      \
                                  spaces_1.label                     \
                                  spaces_1.code                      \
                                  spaces_1.web                       \
                                  spaces_1.tex                       \
                                  spaces_1.web                       \
