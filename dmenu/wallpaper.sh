#! /usr/bin/env sh

# get config
. ~/.config/dmenu-scripts/config.sh
alias yabai="/opt/homebrew/bin/yabai"

# function for choosing a spacific wallpaper
choose () {
    cd $WALLPAPER_DIR
    wall=$(/opt/local/bin/sxiv -r -q -t -b -o *)

    if [ -z "$wall" ]; then
        exit
    fi

    timeout 1s wal -i "${wall}"
    yabai -m config window_shadow off
    echo $(cat ~/.cache/wal/wal) >> ${FOLDER}/.wallpaper_history
}

# function for choosing a random wallpaper
random () {
    export file=$(ls -R $WALLPAPER_DIR | shuf -n 1)
    timeout 1s wal -i $WALLPAPER_DIR/$file
    yabai -m config window_shadow off
    echo $(cat ~/.cache/wal/wal) >> ${FOLDER}/.wallpaper_history
}

# funcion for applying the current wallpaper to your current rice
apply () {
    export currentwall=$(osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)')

    case $(cat ~/Dotfiles/dmenu/themes/current) in
        dt-xmonad) echo $currentwall > ${FOLDER}/themes/wallpapers/dt-xmonad
                   ;;
        pacman) echo $currentwall > ${FOLDER}/themes/wallpapers/pacman
                ;;
        aline) echo $currentwall > ${FOLDER}/themes/wallpapers/aline
    esac
}

# a function to undo setting a wallpaper
undo () {
    export lastwall=$(sed 'x;$!d' < ${FOLDER}/.wallpaper_history)
    timeout 1s wal -i $lastwall
    yabai -m config window_shadow off
}

# a function to confirm setting the wallpaper
confirm () {
    choice=$(printf "Yes\nNo\nNo, Give me another random wallpaper" | ${DMENU} "Do you like your new wallpaper?")
    if [[ $choice == "Yes" ]]; then
        exit
    fi

    if [[ $choice == "No" ]]; then
        undo
    fi

    if [[ $choice == "No, Give me another random wallpaper" ]]; then
        random
        confirm
    fi
}

# list all options
main () {
    choice=$(printf "Choose\nRandom\nApply\nUndo" | ${DMENU} "What would you like to do?")

    if [[ $choice == "Choose" ]]; then
        choose
        confirm
    fi

    if [[ $choice == "Random" ]]; then
        random
        confirm
    fi

    if [[ $choice == "Apply" ]]; then
        apply
    fi

    if [[ $choice == "Undo" ]]; then
        undo
        confirm
    fi
}

main
