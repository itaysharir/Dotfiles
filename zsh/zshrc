#  ___ _
# |_ _| |_ __ _ _   _
#  | || __/ _` | | | |
#  | || || (_| | |_| |  Making Mac Better
# |___|\__\__,_|\__, |
#               |___/

## Export
# Proper colors
export TERM="xterm-256color"
# Add doom emacs to path
export PATH="$HOME/. emacs.d/bin:$PATH"

## Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

## Set oh-my-zsh theme
ZSH_THEME="archcraft" # set by `omz`

## Load oh-my-zsh plugins
plugins=(
  npm
  zsh-autosuggestions
)

## Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

## Aliases
# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'

# Update and upgrade homebrew
alias brewup='brew update && brew upgrade'

# Reboot without sudo
alias reboot='sudo reboot'

# Cd into ~/.config
alias cdconf='cd ~/.config'

# cd up all directories
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# mkdir create parent directories
alias mkdir='mkdir -pv'

# Confirmations
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias ln='ln -i'

# Rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

## Extract files
ex ()
{
    if [ -f "$1" ] ; then
     case $1 in
       *.tar.bz2)   tar xjf $1   ;;
       *.tar.gz)    tar xzf $1   ;;
       *.bz2)       bunzip2 $1   ;;
       *.rar)       unrar x $1   ;;
       *.gz)        gunzip $1    ;;
       *.tar)       tar xf $1    ;;
       *.tbz2)      tar xjf $1   ;;
       *.tgz)       tar xzf $1   ;;
       *.zip)       unzip $1     ;;
       *.Z)         uncompress $1;;
       *.7z)        7z x $1      ;;
       *.deb)       ar x $1      ;;
       *.tar.xz)    tar xf $1    ;;
       *.tar.zst)   unzstd $1    ;;
       *)           echo "'$1' cannot be extracted via ex()" ;;
     esac
   else
     echo "'$1' is not a valid file"
   fi
}
