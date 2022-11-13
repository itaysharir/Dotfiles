# Dotfiles
![Screen Shot 2022-10-16 at 21 54 51](https://user-images.githubusercontent.com/87126382/196052893-bdc32b72-a9c2-4ec1-a21b-2c321156a486.png)

## Quick Note
- The text editor i use is emacs, more spacifically emacs-plus. Which is a tweaked version of emacs for macOS. <br> you can install it with
```brew install emacs-plus --HEAD --with-no-titlebar-and-round-corners```. <br> The Emacs configuration i use is one i didn't actually create, you can find it [here](https://github.com/doomemacs/doomemacs) <br>
## What's New
### Bar
- Removed the system tray (for now)
- New uptime widget
### skhd
- Added A LOT more comments to the config
- Added tmux window and pane managment stuff
### yabai
- Added opacity based focus
- Added A LOT more comments to the config
- Orginized quick settings with variables in the config
- Enabled rounded corners
### README (emacs)
- Now when i have rounded corners enabled in yabai, i changed ```--with-no-titlebar``` to ```--with-no-titlebar-and-round-corners```

## Installation
### Install dependencies
- Install yabai ```brew install koekeishiya/formulae/yabai```
- Install jq ```brew install jq```
- Install skhd ```brew install koekeishiya/formulae/skhd```
- Install alacritty ```brew install alacritty```
- Install sketchybar ```brew tap FelixKratz/formulae; brew install sketchybar```
- Install oh-my-zsh (zsh extention manager) using the instructions [here](https://ohmyz.sh/#install) (just run the command there)
- Install tmux **(NOT IN THE SCREENSHOT, NOT NECESERY)** ```brew install tmux```

### (Not necessary) Install apps i used in the screenshot
- Music visualizer - cava. Install with ```brew install cava```

### Clone this repository
Clone this repo with the following command. <br>
```git clone https://github.com/itaysharir/Dotfiles.git```

### Rename some files
- Rename ```zshrc``` to ```.zshrc``` you can do it with ```mv zshrc .zshrc```
- Rename ```tmux.conf``` to ```.tmux.conf``` you can do that with ```mv tmux.conf .tmux.conf```

### Move files
- move sketchybar to ~/.config/sketchybar ```mv -r sketchybar ~/.config/sketchybar``` <br> 
- Move alacritty to ~/.config/alacritty ```mv -r alacritty ~/.config/alacritty``` <br>
- Move yabai to ~/.config/yabai ```mv -r yabai ~/.config/yabai``` <br>
- Move skhd to ~/.config/skhd ```mv -r skhd ~/.config/skhd``` <br>
- Move cava to ~/.config/cava ```mv -r cava ~/.config/cava```
- Move .zshrc to ~/.zshrc ```mv .zshrc ~/.zshrc```
- Move .tmux.conf to ~/.tmux.conf ```mv .tmux.conf ~/.tmux.conf```

## That's it.
- Feel free to customize my dotfiles to your liking and to submit issues.

## Credits
- Thanks for [distrotube on yt](https://www.youtube.com/channel/UCVls1GmFKf6WlTraIb_IaJg) for the bar design, i remade his bar from scratch. <br>
- Also thanks for [archcraft](https://archcraft.io/) developers for the alacritty config, i took it from there.
