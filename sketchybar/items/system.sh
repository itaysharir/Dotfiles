#!/usr/bin/env sh

sketchybar --add       item               discord right                                       \
           --set       discord            background.image=/Users/itaysharir/.config/sketchybar/assets/discord-logo.png \
                                          background.image.scale=0.015                            \
                                          background.drawing=on                                 \
                                          background.padding_right=4                            \
                                          background.padding_left=-2                            \

# sketchybar --add       alias              "Cardhop,Item-0" right                       \
#            --set    "Cardhop,Item-0" update_freq=1                                 \
#                                           icon.drawing=off                              \
#                                           label.drawing=off                             \
#                                           background.padding_left=-10                    \
#                                           background.padding_right=-11                            \

sketchybar --add       alias              "Control Center,WiFi" right                       \
           --set    "Control Center,WiFi" update_freq=1                                 \
                                          icon.drawing=off                              \
                                          label.drawing=off                             \
                                          background.padding_left=-10                    \
                                          background.padding_right=-8                            \

sketchybar --add       item               net right                                       \
           --set       net                background.image=/Users/itaysharir/.config/sketchybar/assets/network.png \
                                          background.image.scale=0.03                            \
                                          background.drawing=on                                 \
                                          background.padding_right=-6                            \
                                          background.padding_left=-1                    \

sketchybar --add       alias              "Control Center,Sound" right                       \
           --set    "Control Center,Sound" update_freq=1                                 \
                                          icon.drawing=off                              \
                                          label.font="Font Awesome 6 Brands:Regular:12.0"           \
                                          background.padding_right=-14                           \
                                          background.padding_left=-7                           \

sketchybar --add       item               obs right                                       \
           --set       obs                background.image=/Users/itaysharir/.config/sketchybar/assets/obs-logo.png \
                                          background.image.scale=0.028                            \
                                          background.drawing=on                                 \
