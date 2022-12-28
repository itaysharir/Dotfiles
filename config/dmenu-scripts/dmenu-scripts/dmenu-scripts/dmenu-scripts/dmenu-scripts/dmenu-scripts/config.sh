#  ___
# |_ _| |_ __ _ _   _
#  | || __/ _` | | | |  github: https://github.com/itaysharir
#  | || || (_| | |_| |  reddit: u/visible-pop-2576
# |___|\__\__,_|\__, |  dotfiles: https://github.com/itaysharir/Dotfiles
#               |___/
#
# My dmenu scripts are meant to use on macOS
# I've taken a lot of insporation from distrotube and his dmscripts

# general
# settings that apple to all scripts
DMENU="dmenu -i -l 20 -p" # define dmenu prompt
DMENU_APPS="dmenu -i" # define dmenu prompt for apps.sh
FOLDER="/Users/$(whoami)/Dotfiles/dmenu" # the folder where the dmenu scripts are located

# screenshot
# settings for the screenshot script
SCREENSHOTPATH="/Users/$(whoami)/Desktop/" # path to save screenshots to (put a / at the end)
SCREENSHOTNAME="screenshot"                # screenshot name
SCREENSHOTFORMAT="png"                     # screenshot format

# editconfig
# settings for the editconfig script
EDIT="emacsclient"   # editor to launch config files in        (usage: nvim, emacsclient, emacs, vscode)
TERMINAL="Alacritty" # for nvim users, which terminal to use   (usage: kitty, alacritty) # iTerm not supported yet, sorry
