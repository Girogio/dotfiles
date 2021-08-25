#!/bin/bash
nitrogen --restore &
picom &
dwmblocks &
dunst &
redshift -l 35.937496:14.375416 -t 4500:4500 &

xinput --set-prop 11 'libinput Accel Profile Enabled' 0, 1
setxkbmap us,gr -option grp:alt_caps_toggle,grp_led:scroll

export _JAVA_AWT_WM_NONREPARENTING=1

[ -f $XFILES/shades-of-purple.Xresources ] && xrdb $XFILES/shades-of-purple.Xresources

exec dwm
