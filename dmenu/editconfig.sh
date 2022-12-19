#! /usr/bin/env sh

# get config
. ~/.config/dmenu-scripts/config.sh

# list configs
choice=$(printf \
         "alacritty - /Users/$(whoami)/.config/alacritty/alacritty.yml \\
doom emacs config - /Users/$(whoami)/.doom.d/config.el \\
doom emacs init - /Users/$(whoami)/.doom.d/init.el\\
doom emacs packages /Users/$(whoami)/.doom.d/packages.el \\
geany - /Users/$(whoami)/.config/geany/geany.conf \\
kitty - /Users/$(whoami)/.config/kitty/kitty.conf \\
neovim - /Users/$(whoami)/.config/nvim/init.lua \\
rofi - /Users/$(whoami)/.config/rofi/config.rasi \\
sketchybar - /Users/$(whoami)/.config/sketchybar/sketchybarrc \\
skhd - /Users/$(whoami)/.config/skhd/skhdrc \\
yabai - /Users/$(whoami)/.config/yabai/yabairc \\
starship - /Users/$(whoami)/.config/starship.toml \\
tmux - /Users/$(whoami)/.tmux.conf \\
dmenuscripts - /Users/$(whoami)/.config/dmenu-scripts/config.sh \\
zsh - /Users/$(whoami)/.zshrc \
"\
| sed 's/\\//' | ${DMENU} "Edit config:") # pipe configs into dmenu

final=$(cut -d "-" -f2- <<< "$choice") # store the path to desired config in a variable

# check if choice is empty
if [ -z "$choice" ]; then
    exit             # if it is, exit
else
    ${EDIT} $final   # if not, open the selected config in the editor
fi
