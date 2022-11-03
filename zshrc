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
export LANG="en_US.UTF-8"           # configure LANG variable
export LC_COLLATE="en_US.UTF-8"     # configure LC_COLLATE variable
export LC_CTYPE="en_US.UTF-8"       # configure LC_CTYPE variable
export LC_MESSAGES="en_US.UTF-8"    # configure LC_MESSAGES variable
export LC_MONETARY="en_US.UTF-8"    # configure LC_MONTERAY variable
export LC_NUMERIC="en_US.UTF-8"     # configure LC_NUMERIC variable
export LC_TIME="en_US.UTF-8"        # configure LC_TIME variable
export LC_CTYPE="en_US.UTF-8"       # configure LC_CTYPE variable

### Aliases ###
# package managment
alias brewup='brew update && brew upgrade'                           # Update and upgrade homebrew
alias portup='sudo port selfupdate && sudo port upgrade outdated'    # update macports
alias allup='brewup && portup'                                       # Update all packages

# shorten commands
alias cle='clear' # clear the screen quickly
alias ne='neofetch' # run neofetch quickly
alias v="nvim" # open neovim quickly

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
alias addup='git add -u'        # add a file
alias addall='git add .'        # add the whole directory
alias branch='git branch'       # check branch
alias clone='git clone'         # clone a repository
alias commit='git commit -m'    # commit with a message
alias fetch='git fetch'         # fetch details about a repository
alias pull='git pull origin'    # "undo" a push
alias push='git push origin'    # push changes
alias stat='git status'         # view loocal repo status

# make
alias rootmakeins='sudo make install'    # make install with root privlages
alias makeins='make install'             # make install
alias rootmakedel='sudo make uninstall'  # make uninstall
alias makedel='make uninstall'           # make uninstall with root privlages

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
alias .1='cd ..'              # cd 1 directory up
alias .2='cd ../..'           # cd 2 directories up
alias .3='cd ../../..'        # cd 3 directories up
alias .4='cd ../../../..'     # cd 4 directories up
alias .5='cd ../../../../..'  # cd 5 directories up

# when creating a directory, create all parent directories
alias mkdir='mkdir -pv'

# confrimations
alias mv='mv -i' # confirm before overwriting a file with mv
alias cp='cp -i' # confirm before overwriting a file with cp
alias ln='ln -i' # confirm before overwriting a file with ln

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
bindkey -v                  # set vi mode
source $ZSH/oh-my-zsh.sh    # run omz load script
source /Users/itaysharir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
