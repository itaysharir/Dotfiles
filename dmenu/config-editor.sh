#! /usr/bin/env sh

# get config
. ~/.config/dmenu-scripts/config.sh

# store the terminal name but lowercase in a variable
TERM_EXEC=$(echo $TERMINAL | tr '[:upper:]' '[:lower:]')

# if in the config the editor is nvim, then
if [ $EDIT == nvim ]; then
    EDIT="/Applications/$TERMINAL.app/Contents/MacOS/$TERM_EXEC -e nvim "
    # if in the config the editor is emacsclient, then
elif [ $EDIT == emacsclient ]; then
    EDIT="emacsclient -c"
    # if in the config the editor is emacs, then
elif [ $EDIT == emacs ]; then
    EDIT="emacs"
    # if in the config the editor is vscode, then
elif [ $EDIT == vscode ]; then
    EDIT="code"
fi
