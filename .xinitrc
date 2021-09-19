#!/bin/bash
nitrogen --restore &
picom &
dwmblocks &
dunst &
imwheel -b 4 5 &
redshift -l 35.937496:14.375416 -t 4500:4500 &
xss-lock slock &
setxkbmap us,gr -option grp:alt_caps_toggle,grp_led:scroll

[ -f $XFILES/shades-of-purple.Xresources ] && xrdb $XFILES/shades-of-purple.Xresources

exec dwm
