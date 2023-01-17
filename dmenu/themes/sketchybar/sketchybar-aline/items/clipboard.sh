#!/usr/bin/env sh

POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

sketchybar --add item clipboard left                        \
         --set clipboard script="python3 $PLUGIN_DIR/clipboard.py" \
                         updates=on                             \
                         update_freq=30                    \
                         icon=                          \
                         icon.font="Font Awesome 6 Free:Solid:15.0"      \
                         icon.color=0xffd3bd97                      \
                         background.padding_right=8            \
                         background.padding_left=8            \
                         click_script="python3 $PLUGIN_DIR/clipboard.py && $POPUP_CLICK_SCRIPT" \
         --add item clipboard.template left popup.clipboard \
