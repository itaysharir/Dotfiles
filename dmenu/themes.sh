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
    backup=$(printf "Yes\nNo" | ${DMENU} "Backup existing configs?") # ask me if i want to backup the current configs

    if [ $backup == "Yes" ]; then # if i said yes, do the following:
        mv ~/.config/sketchybar ~/.config/sketchybar.old # move sketchybar config to sketchybar.old
        mv ~/.config/yabai ~/.config/yabai.old           # move yabai config to yabai.old
        mv ~/.config/alacritty ~/.config/alacritty.old   # move alacritty config to alacritty.old
        mv ~/.config/nvim ~/.config/nvim.old             # move nvim config to nvim.old
    fi

    # remove current configs
    rm -r ~/.config/sketchybar  # sketchybar
    rm -r ~/.config/nvim/       # nvim
    rm -r ~/.config/alacritty/  # alacritty
    rm -r ~/.config/yabai/      # yabai

    # move desired configs to ~/.config
    cp -r ~/Dotfiles/dmenu/themes/sketchybar/sketchybar-$choice ~/.config/sketchybar    # sketchybar
    cp -r ~/Dotfiles/dmenu/themes/yabai/yabai-$choice ~/.config/yabai                   # yabai
    cp -r ~/Dotfiles/dmenu/themes/alacritty/alacritty-$choice ~/.config/alacritty       # alacritty
    cp -r ~/Dotfiles/dmenu/themes/nvim/nvim-$choice ~/.config/nvim                      # nvim

    # restart services
    brew services restart sketchybar    # sketchybar
    brew services restart yabai         # restart yabai

    # write the theme's number to a text file for other scripts to use
    echo $choice > ~/dmenu\ scripts/themes/current

    # set wallpaper
    export wall=$(cat ~/dmenu\ scripts/themes/wallpapers/$choice) # see what is the applied wallpaper for the selected theme and save it in a variable
    wal -i $wall # set the wallpaper saved in the "wall" variable
fi
