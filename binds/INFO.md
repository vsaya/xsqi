# VCONSOLE Keyboard Configuration Guide (only on systems using systemd, for now)

The following only applies to the virtual consoles (tty).
Xorg and Wayland solutions will follow below.

Use `xfk` alias to load a custom sv-latin1 key layout with
predefined escape<->capslock and shift-ö<->slash rebinds.

This custom layout should be created in this 'binds' folder
BEFORE running the qi script, or alternatively, if the qi
script was already run, copied manually to
~/.local/share/xsm/ after creating it.

Create the layout file by using the commands below, check
key codes with showkey -k.

TODO(maybe): also start the xsm-rebinds program that swaps
escape<->capslock and shift-ö<->slash with xfk.

## Temporary and Permanent layouts

-----
loadkeys sv-latin1
loadkeys /usr/share/kbd/keymaps/i386/qwerty/sv-latin1.map.gz
showkey -k;

-----
vim /etc/vconsole.conf
add:
KEYMAP=sv-latin1

## Create a custom layout file for the xfk alias

-----
TODO: explore if escape can be swaped with capslock like this
cp /usr/share/kbd/keymaps/i386/qwerty/sv-latin1.map.gz ./svmap.map.gz
gunzip svmap.map.gz
vim svmap.map (odearis -> slash (key 39?))
:wq
loadkeys svmap.map

# Xorg Keyboard Configuration

Set keyboard layout with the `setxkbmap` command and use a
xmodmap file in this directory to swap the relavant keys.
This file will be automatically placed at ~/.local/share/xsm
by qi.

This will be managed by the `xfk` alias and -k flag on the
xin command.

NOTE: keycodes are fairly reliable and consistent on all
linux systems, so they will do for now, though the most
reliable, and wha tyou *should* rely on are the keysyms.

Useful commands:

```
setxkbmap -layout se
xmodmap ~/.Xmodmap
xmodmap -pke
localectl set-x11-keymap se - does not work on debian systems!
```
