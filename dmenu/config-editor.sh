#! /usr/bin/env sh

# get config
. ~/.config/dmenu-scripts/config.sh

# store the terminal name but lowercase in a variable
TERM_EXEC=$(echo $TERMINAL | tr '[:upper:]' '[:lower:]')

# if in the config the editor is nvim, them
if [ $EDIT == nvim ]; then
    EDIT="/Applications/$TERMINAL.app/Contents/MacOS/$TERM_EXEC -e nvim "
# if in the config the editor is emacsclient, them
elif [ $EDIT == emacsclient ]; then
    EDIT="emacsclient -c"
# if in the config the editor is emacs, them
elif [ $EDIT == emacs ]; then
    EDIT="emacs"
# if in the config the editor is vscode, them
elif [ $EDIT == vscode ]; then
    EDIT="code"
fi
