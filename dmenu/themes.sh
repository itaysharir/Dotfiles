#! /usr/bin/env sh

# get config
. ~/.config/dmenu-scripts/config.sh

# list options
choice=$(printf \
         "dt-xmonad\\
pacman\\
"\
| sed 's/\\//' | ${DMENU} "Select theme:") # pipe options into dmenu

# if choice is empty, DO NOT PROCEED
if [ -z $choice ]; then
    exit
else # if choice is not empty, do the following:

    # move sketchybar up
    sketchybar --animate sin 30 --bar y_offset=-100

    # remove current configs
    rm -r ~/.config/sketchybar  # sketchybar
    rm -r ~/.config/nvim/       # nvim
    rm -r ~/.config/alacritty/  # alacritty
    rm -r ~/.config/yabai/      # yabai

    # move desired configs to ~/.config
    cp -r ${FOLDER}/themes/sketchybar/sketchybar-$choice ~/.config/sketchybar    # sketchybar
    cp -r ${FOLDER}/themes/yabai/yabai-$choice ~/.config/yabai                   # yabai
    cp -r ${FOLDER}/themes/alacritty/alacritty-$choice ~/.config/alacritty       # alacritty
    cp -r ${FOLDER}/themes/nvim/nvim-$choice ~/.config/nvim                      # nvim

    # apply new yabai config
    . ~/.config/yabai/yabairc # apply new config

    # make sketchybar use the new config without restarting
    sketchybar --remove '/.*/'
    ~/.config/sketchybar/sketchybarrc

    # write the theme's number to a text file for other scripts to use
    echo $choice > ~/dmenu\ scripts/themes/current

    # set wallpaper
    wall=$(cat "${FOLDER}/themes/wallpapers/$choice") # see what is the applied wallpaper for the selected theme and save it in a variable
    wal -i $wall # set the wallpaper saved in the "wall" variable
fi
