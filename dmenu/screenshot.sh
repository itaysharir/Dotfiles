#! /usr/bin/env sh

# get config
. ~/.config/dmenu-scripts/config.sh

# list options
choice=$(printf \
         "Fullscreen\\
Reigon\\
"\
| sed 's/\\//' | ${DMENU} "Search:") # pipe configs into dmenu

case $choice in
    "Fullscreen") screencapture ${SCREENSHOTPATH}${SCREENSHOTNAME}.${SCREENSHOTFORMAT}
                  ;;
    "Reigon") screencapture -i ${SCREENSHOTPATH}${SCREENSHOTNAME}.${SCREENSHOTFORMAT}
esac
