#! /usr/bin/env sh

# get config
. ~/.config/dmenu-scripts/config.sh

# list options
choice=$(printf \
         "Fullscreen\\
Reigon\\
"\
| sed 's/\\//' | ${DMENU} "Search:") # pipe configs into dmenu

if [ $choice == "Fullscreen" ]; then
    screencapture ${SCREENSHOTPATH}${SCREENSHOTNAME}.${SCREENSHOTFORMAT}
fi

if [ $choice == "Reigon" ]; then
    screencapture -i ${SCREENSHOTPATH}${SCREENSHOTNAME}.${SCREENSHOTFORMAT}
fi
