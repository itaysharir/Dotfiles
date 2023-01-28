#  ___
# |_ _| |_ __ _ _   _
#  | || __/ _` | | | |  github: https://github.com/itaysharir
#  | || || (_| | |_| |  reddit: u/visible-pop-2576
# |___|\__\__,_|\__, |  dotfiles: https://github.com/itaysharir/Dotfiles
#               |___/
#
# My dmenu scripts are meant to use on macOS
# (the default values in brackets are what happens if the variable is set to nothing or an invalid value)

# general
# settings that apply to all scripts
DMENU="dmenu -i -l 20 -p" # define dmenu prompt
DMENU_APPS="dmenu -i" # define dmenu prompt for apps.sh
FOLDER="$HOME/Dotfiles/dmenu" # the folder where the dmenu scripts are located

# wallpapers
# settings for the wallpaper script
WALLPAPER_DIR="$HOME/wallpapers" # directory with wallpaper image files

# screenshot
# settings for the screenshot script
SCREENSHOTPATH="$HOME/Desktop/"            # path to save screenshots to (put a / at the end)
SCREENSHOTNAME="screenshot"                # screenshot name
SCREENSHOTFORMAT="png"                     # screenshot format

# themes
# settings for the themes script
SHOW_DOCK_ON_STOCK="true"      # show or hide the dock in the stock theme                                   (usage: true/false) (default: false)
SHOW_MENUBAR_ON_STOCK="true"   # show or hide the menu bar in the stock theme                               (usage: true/false) (default: true)
STOCK_APPEARENCE="dark"        # dark or light mode in the stock theme                                      (usage: light/dark) (default: light)
CUSTOM_THEME_APPEARENCE="dark" # dark or light mode in custom themes (all themes apart from the stock one)  (usage: light/dark) (default: dark)

# editconfig
# settings for the editconfig script
edit="emacsclient"   # editor to launch config files in        (usage: nvim, emacsclient, emacs, vscode)
terminal="alacritty" # for nvim users, which terminal to use   (usage: kitty, alacritty)  note: iterm and terminal.app are not supported yet, sorry
