# xsqi - xsaya's quick installer [xsm devkit]

## installation

To deploy all configuration files and binaries to their
respective locations within your $HOME directory, use the
following command

`./qi install`

This creates symlinks for the configuration files and backs
up existing configuration with a .bk suffix.

The binary toolkit is copied to $HOME/.local/bin.

To uninstall and reinstate original configs, use the
following command

`./qi clean`

## Packages - Installation

### Headless

`sudo pacman -S --needed vim tmux fzf fd rg lf`

`sudo apt install vim tmux fzf fd rg lf`

`sudo dnf install vim tmux fzf fd rg lf`

### Desktop

`sudo pacman -S --needed vim tmux fzf fd rg lf kitty`

`sudo apt install vim tmux fzf fd rg lf kitty`

`sudo dnf install vim tmux fzf fd rg lf kitty`

