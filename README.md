# xsqi - [xsm devkit]

xsqi is a light-weight devkit based on xsm configurations.
It aims to use small, effective tools together with vim and
tmux to create a minimalistic, yet very powerful developer
environment using only a handful of configuration files.

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

## Packages - Devkit Swiss Army Knife | Headless [Desktop]

headless:  /.*lf/

vim tmux fzf zoxide curl gpg fd rg lf kitty

### Starship - Installation

`curl -sS https://starship.rs/install.sh | sh`

### Package manager help commands

`sudo pacman -S --needed || sudo apt install || sudo dnf install`
