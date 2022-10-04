#!/usr/bin/env sh

HAS_BATTERY=$(if [ "$(pmset -g batt | grep "Battery")" = "" ]; then echo "false"; else echo "true"; fi)
SVIM_POPUP_SCRIPT="sketchybar --set system.svim popup.drawing=off"

sketchybar --add       item               system.svim right                                 \
           --set       system.svim        popup.align=left                              \
                                          icon=$VIM                                     \
                                          icon.font="Hack Nerd Font Mono:Bold:26.0"     \
                                          label.font="Hack Nerd Font Mono:Bold:12.0"    \
                                          icon.color=$ICON_COLOR                        \
                                          script="$SVIM_POPUP_SCRIPT"                   \
                                          background.padding_right=-11                    \
           --subscribe system.svim        front_app_switched window_focus               \
                                                                                        \
           --add       item               svim.cmdline popup.system.svim                \
           --set       svim.cmdline       icon="Command: "                              \

sketchybar --add       alias              "Control Center,WiFi" right                       \
           --set    "Control Center,WiFi" update_freq=1                                 \
                                          icon.drawing=off                              \
                                          label.drawing=off                             \
                                          background.padding_left=-9                    \
                                          background.padding_right=-12                   \

sketchybar --add       alias              "Control Center,Sound" right                       \
           --set    "Control Center,Sound" update_freq=1                                 \
                                          icon.drawing=off                              \
                                          label.drawing=off                             \
                                          background.padding_left=-8                    \
                                          background.padding_right=-7                   \

sketchybar --add       alias              "SystemUIServer,AppleTimeMachineExtra" right                       \
           --set    "SystemUIServer,AppleTimeMachineExtra"   update_freq=1                                 \
                                          icon.drawing=off                              \
                                          label.drawing=off                             \
                                          background.padding_left=-19                    \
                                          background.padding_right=-9                   \

sketchybar --add       alias              "Control Center,BentoBox" right                       \
           --set    "Control Center,BentoBox"   update_freq=1                                 \
                                          icon.drawing=off                              \
                                          label.drawing=off                             \
                                          background.padding_left=-9                    \
                                          background.padding_right=4                   \

           --add       bracket            system                                        \
                                          system.svim                                   \
