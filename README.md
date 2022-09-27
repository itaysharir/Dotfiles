# Dotfiles
![Screen Shot 2022-09-26 at 23 27 26](https://user-images.githubusercontent.com/87126382/192373540-4fc859ea-9421-481c-b752-340d22a22bdc.png)

## Quick Note
- The text editor i use is emacs, more spacifically emacs-plus. Which is a tweaked version of emacs for macOS. <br> you can install it with
```brew install emacs-plus --HEAD --with-no-titlebar```. <br> The Emacs configuration i use is one i didn't actually create, you can find it [here](https://github.com/doomemacs/doomemacs) <br>

## Installation
### Install dependencies
- Install yabai ```brew install koekeishiya/formulae/yabai```
- Install skhd ```brew install koekeishiya/formulae/skhd```
- Install alacritty ```brew install alacritty```
- Install sketchybar ```brew tap FelixKratz/formulae; brew install sketchybar```
- Install oh-my-zsh (zsh extention manager) using the instructions [here](https://ohmyz.sh/#install) (just run the command there)
- Install spaceship (the zsh prompt itself) ```brew install spaceship```

### (Not necessary) Install apps i used in the screenshot
- Ascii art (Right side) - colorscripts [you can find them here](https://gitlab.com/dwt1/shell-color-scripts), I installed them using nixpkgs but you can compile from source if you want to. <br>
- System monitor: htop - Install it with: ```brew install htop```

### Clone this repository
Clone this repo with the following command. <br>
```git clone https://github.com/itaysharir/Dotfiles.git```

### Rename some files
- Rename zsh/zshrc to .zshrc (add a dot in the beginning of the filename). Github wouldn't let me upload hidden files.

### Move files
- move sketchybar to ~/.config/sketchybar <br>
- Move alacritty to ~/.config/alacritty <br>
- Move yabai to ~/.config/yabai <br>
- Move skhd to ~/.config/skhd <br>
- Move zsh/.zshrc to ~/.zshrc (renamed from zshrc to .zshrc)

## That's it.
- Feel free to customize my dotfiles to your liking and to submit issues.

## Credits
- Thanks for [distrotube on yt](https://www.youtube.com/channel/UCVls1GmFKf6WlTraIb_IaJg) for the bar design, i remade his bar from scratch. <br>
- Also thanks for [archcraft](https://archcraft.io/) developers for the alacritty config, i took it from there.
