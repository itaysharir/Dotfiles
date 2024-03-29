# Dotfiles | A collection of macOS themes

## ☘️ Introduction
I'm Itay, and i love making my computer look and behave just like i want it to. These are my Dotfiles, with 3 (Technically 4) themes. Enjoy! <br>

https://user-images.githubusercontent.com/87126382/212973076-3a796a19-ae06-4aa9-83e1-671493efe326.mp4

## 🚀 Dmenu script for switching between themes
<img src="assets/themes_dmenu.png" align="right" height="200px" width="400">

|OS|macOS (Ventura, 13.1)|
|:---:|:---:|
|Machine|M1 MacBook Pro, Late 2020|
|WM|[yabai](https://github.com/koekeishiya/yabai)|
|Bar|[sketchybar](https://github.com/FelixKratz/SketchyBar)|
|Menu|[Dmenu](https://tools.suckless.org/dmenu/)|
|Terminal|[alacritty](https://github.com/alacritty/alacritty)|

## 💡 Why are my Dotfiles different than (most) others?
- 3 (Technically 4) different themes instead of 1
- A dmenu script to easily switch between these themes
- Not just themes, A bunch of dmenu scripts!

<table align="center">
   <tr>
      <th align="center">
         <sup><sub>:warning: WARNING :warning:</sub></sup>
      </th>
   </tr>
   <tr>
      <td align="center">
      
      I USE AN M1 MACBOOK PRO FROM LATE 2020, I DON'T KNOW
      HOW WELL MY DOTFILES ARE GONNA WORK ON OTHER MACHINES.
     
   </tr>
   </table>
   
## 🎨 The themes
### 🍄 Pacman:
|<img src="assets/pacman_rice.png" align="center" width="600px">|<img src="assets/pacman_rice_used.png" align="center" width="600px">|
|---|---|

### 🐚 DT’s Xmonad:
|<img src="assets/dt-xmonad_rice.png" align="center" width="600px">|<img src="assets/dt-xmonad_rice_used.png" align="center" width="600px">|
|---|---|

### 🪸 Aline:
|<img src="assets/aline_rice.png" align="center" width="600px">|<img src="assets/aline_rice_used.png" align="center" width="600px">|
|---|---|

### 🪴 Stock:
|<img src="assets/stock_rice.png" align="center" width="600px">|<img src="assets/stock_rice_used.png" align="center" width="600px">|
|---|---|

## 📦 Setup
To install my Dotfiles, i made an easy install script. To use it, run the following command. <br>
```/bin/sh -c "$(curl https://raw.githubusercontent.com/itaysharir/Dotfiles/main/install.sh)"```
<p style="font-weight: Bold; color: red;">Running the script is recommended over installing manually, manual installing can cause issues with dmenu.</p>

<details id="manual">
<summary><b>For manual setup</b></summary>

## Manual Setup - Themes
### Install dependencies
- If you don't have brew installed, obviously install it
```
if ! command -v brew &> /dev/null
then
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
   echo "brew is already installed, you're set."
fi
```
- Install the rest of the dependencies
```
# programs
brew tap FelixKratz/formulae
brew install sketchybar
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew install alacritty
brew install jq
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install cava
brew install starship

# fonts
brew tap homebrew/cask-fonts
brew install font-ubuntu
brew install font-fontawesome
brew install font-hack-nerd-font
brew install font-fira-code-nerd-font
brew install --cask font-monocraft

# fonts that aren't avalible in brew
git clone https://github.com/itaysharir/Dotfiles ~/Dotfiles && cd Dotfiles
cd misc/fonts
cp Pacman-Dots.ttf ~/Library/Fonts/Pacman-Dots.ttf
```

### Move files (By default for pacman setup)
```
# theme spacific
cd ~/Dotfiles
cp -r config/rices/Pacman/sketchybar ~/.config/sketchybar
cp -r config/rices/Pacman/yabai ~/.config/yabai
cp -r config/rices/Pacman/skhd ~/.config/skhd
cp -r config/rices/Pacman/alacritty ~/.config/alacritty
cp -r config/rices/Pacman/nvim ~/.config/nvim
cp -r config/rices/Pacman/cava ~/.config/cava

# not theme spacific
cp -r config/dmenu-scripts ~/.config/dmenu-scripts
cp config/zsh/.zshrc ~/.zshrc
cp -r config/zsh/.zsh ~/.zsh
cp config/starship/starship.toml ~/.config/starship.toml
```

### Start services
```
brew sevices start yabai
brew sevices start skhd
brew sevices start sketchybar
```
## Manual Setup - Dmenu
### Install dependencies
- Install macports (the following command is for macos ventura, install manually for other versions)
```
if ! command -v port &> /dev/null
then
   brew install wget
   wget https://github.com/macports/macports-base/releases/download/v2.8.0/MacPorts-2.8.0-13-Ventura.pkg
   open MacPorts-2.8.0-13-Ventura.pkg
   echo "_________"
   echo ""
   echo "Follow the instructions on-screen to install macports"
else
   echo "macports is already installed, you're set."
fi
```
- Install dependencies for dmenu (on mac) with macports (This procces is going to take some time, **DO NOT** cancel the installation in the middle)
```
sudo port install dmenu
sudo port uninstall dmenu
# installing and then uninstalling right away might seem pointless, but this way all dependencies are installed.
```

- Install dependencies for the wallpaper script
```
sudo port install sxiv # image viewer
# pywal fork
sudo pip3 uninstall pywal; sudo rm $(which wal) # if pywal is installed, remove it
git clone https://github.com/robwaz/pywal && cd pywal
sudo pip3 install -e ./ # build
```
### Install my build of dmenu
- If you didn't follow the instructions in "Setup - Themes", run the following:
```
brew install koekeishiya/formulae/skhd
git clone https://github.com/itaysharir/Dotfiles ~/Dotfiles
cd Dotfiles
cp -r config/rices/Pacman/skhd ~/.config/skhd
```
- Now cd into dmenu/dmenu-4.9 and compile
```
cd dmenu/dmenu-4.9
sudo make install
brew services restart skhd
```
- Reboot
- Now dmenu and the scripts are installed. If you've followed all above instructions, you should be able to hit ```cmd + shift + return``` to open the dmenu script that launches apps. See my skhd config for additional keyblindings. 

</details>

## 🚧 Troubleshooting
- If Xquartz crashes immediately after hitting the keyblindings or running dmenu, remove ~/.xinitrc <br>
```mv ~/.xinitrc ~/.xinitrc.backup``` 
- If dmenu doesn't work when the "Dotfiles" folder is removed, copy the "dmenu" folder to a new location (because you cannot remove that folder), then change the variable $FOLDER in ~/.config/dmenu-scripts/config.sh to the new dmenu folder location.

## 🎉 Credits
- Obviously, DT. I took HUGE insporation for the "DT's Xmonad" theme from your xmobar & xmonad configs.
- [gh0stzk](https://github.com/gh0stzk/dotfiles) I also took HUGE inspotations from your Emilia theme for my "Pacman" theme. I also completly ripped off your README.md design
