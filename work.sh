#!/bin/sh
xrandr --output HDMI-2 --off --output HDMI-1 --off --output DP-1 --mode 1920x1200 --pos 0x0 --rotate normal --output eDP-1 --primary --mode 1440x900 --pos 3840x392 --rotate normal --output DP-2 --mode 1920x1200 --pos 1920x0 --rotate normal

setxkbmap -option
xmodmap ~/.mode_switch
xcape -e 'Mode_switch=Escape'

