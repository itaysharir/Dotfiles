#!/usr/bin/env sh

HAS_BATTERY=$(if [ "$(pmset -g batt | grep "Battery")" = "" ]; then echo "false"; else echo "true"; fi)

sketchybar --add       event              window_focus                                  \
                                                                                        \
           --clone     system.label       label_template                                \
           --set       system.label       label=Window                                  \
                                          position=q                                    \
                                          drawing=on                                    \
                                          background.padding_right=0                    \
                                          script="$PLUGIN_DIR/window_title.sh"          \
           --subscribe system.label       front_app_switched                            \
                                                                                        \
           --add       bracket            system                                        \
                                          system.label                                  \
