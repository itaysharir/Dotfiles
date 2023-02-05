#! /usr/bin/env sh

# get config
. ~/.config/dmenu-scripts/config.sh

# list options
choice=$(printf \
         "dt-xmonad\\
pacman\\
aline\\
stock\\
"\
| sed 's/\\//' | ${DMENU} "Select theme:") # pipe options into dmenu

# if choice is empty, DO NOT PROCEED
if [ -z $choice ]; then
    exit
else # if choice is not empty, do the following:
    current=$(cat ~/Dotfiles/dmenu/themes/current)

    if [ $choice == "stock" ] && [ $current == "stock" ]; then
        osascript -e 'display dialog "Switching from the stock theme to the stock theme again is going to cause issues with menubar and dock hiding. Please switch to another theme, then to the stock theme."'
        exit
    fi

    if [ $choice == "stock" ]; then
        brew services stop sketchybar

        if [ $SHOW_DOCK_ON_STOCK == "true" ]; then
            osascript -e "tell application \"System Events\" to set the autohide of the dock preferences to false"
        fi

        if [ $SHOW_MENUBAR_ON_STOCK == "true" ]; then
            osascript -e 'tell application "System Events"
            tell dock preferences to set autohide menu bar to not autohide menu bar
            end tell'
        fi

        if [ $STOCK_APPEARENCE == "dark" ]; then
            osascript -e 'tell application "System Events"
                tell appearance preferences
                    set dark mode to true
                end tell
            end tell'
        else
            osascript -e 'tell application "System Events"
                tell appearance preferences
                    set dark mode to false
                end tell
            end tell'
       fi

        rm -r ~/.config/sketchybar  # sketchybar
        rm -r ~/.config/nvim/       # nvim
        rm -r ~/.config/alacritty/  # alacritty
        rm -r ~/.config/yabai/      # yabai
        rm -r ~/.config/skhd/       # skhd

        # move desired configs to ~/.config
        cp -r ${FOLDER}/themes/yabai/yabai-$choice ~/.config/yabai                   # yabai
        cp -r ${FOLDER}/themes/skhd/skhd-$choice ~/.config/skhd                      # skhd
        cp -r ${FOLDER}/themes/alacritty/alacritty-$choice ~/.config/alacritty       # alacritty
        cp -r ${FOLDER}/themes/nvim/nvim-$choice ~/.config/nvim                      # nvim

        # apply new yabai config (without settings layout)
        yabai_no_layout=$(sed -n '/bsp/!p' ~/.config/yabai/yabairc) # store yabai config but without layout in a varible
        sh -c "$yabai_no_layout" # run everything in the variable

        # write the theme's number to a text file for other scripts to use
        echo $choice > "${FOLDER}/themes/current"

        # set wallpaper
        wall=$(cat $HOME/Dotfiles/dmenu/themes/wallpapers/$choice) # see what is the applied wallpaper for the selected theme and save it in a variable
        timeout 1s wal -i $wall # set the wallpaper saved in the "wall" variable

        # add back proper borders yabai
        /opt/homebrew/bin/yabai -m config window_shadow off

        # Restart Xquartz
        killall Xquartz
        open -a Xquartz

        exit
    fi

    # if the last theme was stock, do the following:
    if [ $current == "stock" ]; then
        # hide the dock and menubar
        if [ $SHOW_DOCK_ON_STOCK == "true" ]; then
            osascript -e "tell application \"System Events\" to set the autohide of the dock preferences to true"
        fi

        if [ $SHOW_MENUBAR_ON_STOCK == "true" ]; then
            osascript -e 'tell application "System Events"
                tell dock preferences to set autohide menu bar to not autohide menu bar
                end tell'
        fi

        # set dark/light mode
        if [ $CUSTOM_THEME_APPEARENCE == "dark" ]; then
            osascript -e 'tell application "System Events"
                tell appearance preferences
                    set dark mode to true
                end tell
            end tell'
        else
            osascript -e 'tell application "System Events"
                tell appearance preferences
                    set dark mode to false
                end tell
            end tell'
       fi

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
    rm -r ~/.config/skhd/       # skhd

    # move desired configs to ~/.config
    cp -r ${FOLDER}/themes/sketchybar/sketchybar-$choice ~/.config/sketchybar    # sketchybar
    cp -r ${FOLDER}/themes/yabai/yabai-$choice ~/.config/yabai                   # yabai
    cp -r ${FOLDER}/themes/skhd/skhd-$choice ~/.config/skhd                      # skhd
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
    wall=$(cat $HOME/Dotfiles/dmenu/themes/wallpapers/$choice) # see what is the applied wallpaper for the selected theme and save it in a variable
    timeout 1s wal -i $wall # set the wallpaper saved in the "wall" variable

    # add back proper borders yabai
    /opt/homebrew/bin/yabai -m config window_shadow off

    # Restart Xquartz
    killall Xquartz
    open -a Xquartz
fi
