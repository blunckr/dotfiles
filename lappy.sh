#!/bin/sh
xrandr --output HDMI-2 --off --output HDMI-1 --off --output DP-1 --off --output eDP-1 --primary --mode 1440x900 --pos 0x0 --rotate normal --output DP-2 --off

setxkbmap -option
setxkbmap -option altwin:swap_alt_win
xmodmap ~/.mode_switch
xcape -e 'Mode_switch=Escape'
