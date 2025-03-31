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


### Packages - Devkit Swiss Army Knife | Primarily for Desktop

These are the package dependencies, not all Linux
distributions may have all the packages in their core
repositories, but packages can be installed in any way
necessary. (See package manager examples below)

base:
gvim tmux fzf zsh zoxide curl gpg xclip
or vim-gtk

extra:
fd rg lf kitty
(can always get binaries if not available from main repo)

### Starship (optional)

If starship is not found, a regular, basic prompt is
configured.

`curl -sS https://starship.rs/install.sh | sh`

### Package manager syntax reminder

`sudo pacman -S --needed || sudo apt install || sudo dnf install`

## Removal

To uninstall and reinstate original configs, use the
following command

`./qi clean`

NOTE: Some configuration folders and cache files may remain,
but these can easily be dealt with manually if necessary.
(.local and .config and .cache if starship was used)
