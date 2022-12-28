#! /usr/bin/env sh

step () {
    final=$(echo "$@")
    plus=$(expr ${#final} + 6)

    printhashtags () {
    for i in $(seq $plus); do
        printf "#"
    done

    }

    echo
    printhashtags
    echo "\n## $@ ##"
    printhashtags
    echo "\n"
}

step "Checking if brew is installed"

if ! command -v brew &> /dev/null
then
   step "It's not, installing"
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
   eval "$(/opt/homebrew/bin/brew shellenv)"
else
   echo "brew is already installed, you're set."
fi

step "Installing dialog"
if ! command -v brew &> /dev/null
then
   step "It's not, installing"
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
   eval "$(/opt/homebrew/bin/brew shellenv)"
else
   echo "brew is already installed, you're set."
fi

step "Installing dependencies/apps/sketchybar"
brew tap FelixKratz/formulae
brew install sketchybar

step "Installing dependencies/apps/yabai"
brew install koekeishiya/formulae/yabai

step "Installing dependencies/apps/skhd"
brew install koekeishiya/formulae/skhd

step "Installing dependencies/apps/alacritty"
brew install alacritty

step "installing dependencies/apps/jq"
brew install jq

step "Installing dependencies/apps/oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

step "Installing dependencies/apps/cava"
brew install cava

step "Installing dependencies/apps/starship"
brew install starship

step "Installing apps/firefox"
brew install firefox

step "Tapping fonts repo"
brew tap homebrew/cask-fonts

step "Installing dependencies/fonts/ubuntu"
brew install font-ubuntu

step "Installing dependencies/fonts/font-awesome"
brew install font-fontawesome

step "Installing dependencies/fonts/hack-nerd-font"
brew install font-hack-nerd-font

step "Installing dependencies/fonts/fira-code-nerd-font"
brew install font-fira-code-nerd-font

step "Installing dependencies/fonts/monoscraft"
brew install font-monocraft

step "Cloning my Dotfiles repository"
git clone https://github.com/itaysharir/Dotfiles ~/Dotfiles && cd Dotfiles

step "Installing dependencies/fonts/pacman (My own font for pacman symobols)"
cp misc/fonts/Pacman-Dots.ttf ~/Library/Fonts/Pacman-Dots.ttf

step "Moving everything to the right place"
# theme spacific
cp -r config/rices/Pacman/sketchybar ~/.config/sketchybar
cp -r config/rices/Pacman/yabai ~/.config/yabai
cp -r config/rices/Pacman/skhd ~/.config/skhd
cp -r config/rices/Pacman/alacritty ~/.config/alacritty
cp -r config/rices/Pacman/cava ~/.config/cava

# not theme spacific
cp -r config/dmenu-scripts ~/.config/dmenu-scripts
cp config/zsh/.zshrc ~/.zshrc
cp -r config/zsh/.zsh ~/.zsh
cp config/starship/starship.toml ~/.config/starship.toml

step "Installing dmenu (??)"
read -p "Do you wish to install dmenu? (This is going to take a while) (y/n) " yn
case $yn in
	[yY] )
        step "Checking if macports is installed"
         if ! command -v port &> /dev/null; then
            step "It's not, installing"
            brew install wget
            wget https://github.com/macports/macports-base/releases/download/v2.8.0/MacPorts-2.8.0-13-Ventura.pkg
            open MacPorts-2.8.0-13-Ventura.pkg
            dialog --prgbox "Prompt" "echo 'Press OK when the install \nfinished'"  10 30
        else
            echo "macports is already installed, you're set."
        fi

        step "Installing dependencies/dmenu (This is going to take about 20 minutes, do not cancel the script)"
        sudo port install dmenu
        sudo port uninstall dmenu
        # installing and then uninstalling right away might seem pointless, but this way all dependencies are installed.

        step "Installing dependencies/dmenu/script/wallpaper/sxiv"
        sudo port install sxiv

        step "Installing dependencies/dmenu/script/wallpaper/pywal (fork)"
        sudo pip3 uninstall pywal; sudo rm $(which wal) # if pywal is installed, remove it
        git clone https://github.com/robwaz/pywal && cd pywal
        sudo pip3 install -e ./ # build

        step "Installing my build of dmenu"
        cd dmenu/dmenu-4.9
        sudo make install
		;;
	[nN] ) echo "Alright then, start the services!";
		;;
	* ) echo invalid response;;
esac

step "Starting services"
brew services start sketchybar
brew services start yabai
brew services start skhd

step "That's It!"