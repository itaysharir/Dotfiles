#! /usr/bin/env sh

# get config
. ~/.config/dmenu-scripts/config.sh

# list options
choice=$(printf \
         "dt-xmonad\\
pacman\\
stock\\
"\
| sed 's/\\//' | ${DMENU} "Select theme:") # pipe options into dmenu

# if choice is empty, DO NOT PROCEED
if [ -z $choice ]; then
    exit
else # if choice is not empty, do the following:
    # if choice is stock, do the following ONLY, then exit
    if [ $choice == "stock" ]; then
        # stop services
        brew services stop sketchybar
        brew services stop yabai

        # enable dock and menubar
        osascript -e 'tell application "System Events"
        tell dock preferences to set autohide menu bar to not autohide menu bar
        end tell'

        # restart xquartz
        killall Xquartz
        open -a Xquartz

        echo $choice > "${FOLDER}/themes/current"

        # set wallpaper
        wall=$(cat "${FOLDER}/themes/wallpapers/$choice") # see what is the applied wallpaper for the selected theme and save it in a variable
        timeout 1s wal -i $wall # set the wallpaper saved in the "wall" variable

        exit
    fi

    # Restart Xquartz
    killall Xquartz
    open -a Xquartz

    current=$(cat ~/Dotfiles/dmenu/themes/current)
    # make sure dock and menubar are hidden
    if [ $current == "stock" ]; then
         osascript -e 'tell application "System Events"
             tell dock preferences to set autohide menu bar to not autohide menu bar
             end tell'
    fi

    # make sure yabai and sketchybar are active
    brew services start yabai
    brew services start sketchybar

    # move sketchybar up
    sleep 1
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

    # apply new yabai config (without settings layout)
    yabai_no_layout=$(sed -n '/bsp/!p' ~/.config/yabai/yabairc) # store yabai config but without layout in a varible
    sh -c "$yabai_no_layout" # run everything in the variable

    # make sketchybar use the new config without restarting
    sketchybar --remove '/.*/'
    ~/.config/sketchybar/sketchybarrc

    # write the theme's number to a text file for other scripts to use
    echo $choice > "${FOLDER}/themes/current"

    # set wallpaper
    wall=$(cat "${FOLDER}/themes/wallpapers/$choice") # see what is the applied wallpaper for the selected theme and save it in a variable
    timeout 1s wal -i $wall # set the wallpaper saved in the "wall" variable

    # add back proper borders yabai
    /opt/homebrew/bin/yabai -m config window_shadow off
fi
