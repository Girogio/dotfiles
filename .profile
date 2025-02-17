#!/bin/bash

# Defualt Programs
export EDITOR=nvim
export OPENER=xdg-open
export PAGER=less
export SHELL=bash

export PATH="$PATH:$HOME/.local/bin:$HOME/.local/bin/scripts/"
export XDG_CONFIG_HOME="$HOME/.config"
export XFILES="$XDG_CONFIG_HOME/X11"

export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export QT_QPA_PLATFORMTHEME="gtk2"
if [ "$(tty)" = "/dev/tty1" ]; then 
 	startx "$HOME/.xinitrc"
fi
