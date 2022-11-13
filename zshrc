#  ___
# |_ _| |_ __ _ _   _   
#  | || __/ _` | | | |  github: https://github.com/itaysharir
#  | || || (_| | |_| |  reddit: u/visible-pop-2576
# |___|\__\__,_|\__, |  dotfiles: https://github.com/itaysharir/Dotfiles
#               |___/  

### Export ###
export TERM="xterm-256color"                          # proper colors
export ZSH_THEME="spaceship"                          # Set oh-my-zsh theme
export ZSH="$HOME/.oh-my-zsh"                         # declare a variable to omz path

### Load tmux ###
if [ "$TMUX" = "" ]; then tmux; fi

# add stuff to $PATH
export PATH=$PATH:/Users/itaysharir/.spicetify        # add spicetify to $PATH
export PATH="$HOME/.emacs.d/bin:$PATH"                # Add doom executable to $PATH
export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH"  # add sphinx to $PATH

# pacman
export BOOTSTRAP=/opt/pacman
export PATH=$BOOTSTRAP/bin:$PATH

# locale
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

### Aliases ###
# upgrades
alias brewup='echo "Updating homebrew itself:" && brew update && echo "_______________________________" && echo " " && echo "Upadating packages..." && brew upgrade && echo "Everything is up-to-date."'
alias portup='sudo port selfupdate && sudo port upgrade outdated'

# brew
alias bw='brew'
alias bwI='brew install'
alias bwE='brew reinstall'
alias bwR='brew remove'
alias bwU='brewup'
alias bwS='brew services'
alias bwRestart='brew services restart'
alias bwStart='brew services start'
alias bwStop='brew services stop'

# shorten commands
alias cle='clear'
alias ne='neofetch'
alias v="nvim"

# shpotify
alias play='spotify play'                         # play a song on spotify
alias pause='spotify pause'                       # pause a song on spotify
alias liked='spotify play list Liked Songs'       # play song from liked songs
alias next='spotify next'                         # skip a track
alias prev='spotify prev'                         # go back to the previous track
alias jumpto='spotify pos'                        # jump to a spacific moment in the song (usage: jumpto <time>)
alias nowplaying='spotify status'                 # see details about currently playing song
alias shuffle='spotify toggle shuffle'            # toggle shuffle

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'

# source .zshrc
alias src='source ~/.zshrc' # apply changes made in .zshrc without closing zsh

# emacs and doom emacs
alias em="emacsclient -t"                         # launch an emacs client quickly in the terminal
# alias emacs="emacsclient -c"                      # launch an emacs client quickly
alias doomsync="~/.emacs.d/bin/doom sync"         # sync doom emacs plugins
alias doomdoctor="~/.emacs.d/bin/doom doctor"     # check doom emacs for errors
alias doomupgrade="~/.emacs.d/bin/doom upgrade"   # upgrade doom emacs
alias doompurge="~/.emacs.d/bin/doom purge"       # purge plugins in doom emacs

# shorten cd ../../../
alias .1='cd ..'              
alias .2='cd ../..'           
alias .3='cd ../../..'        
alias .4='cd ../../../..'     
alias .5='cd ../../../../..'  

# when creating a directory, create all parent directories
alias mkdir='mkdir -pv'

# confrimations
alias mv='mv -i' 
alias cp='cp -i' 
alias ln='ln -i' 

### tell omz which plugins to load ###
plugins=(
  zsh-autosuggestions
)
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  # enable syntax highlighting

### function to easily extract files ###
# usage: ex <file>
ex ()
{
    if [ -f "$1" ] ; then
     case $file in
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

### startup ###
source $ZSH/oh-my-zsh.sh    # run omz load script
source /Users/itaysharir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
