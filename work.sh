#!/bin/sh
xrandr --output HDMI-2 --off --output HDMI-1 --off --output DP-1 --mode 1920x1200 --pos 0x0 --rotate normal --output eDP-1 --mode 1440x900 --pos 3840x392 --rotate normal --output DP-2 --primary --mode 1920x1200 --pos 1920x0 --rotate normal

setxkbmap -option
xmodmap ~/.mode_switch
xcape -e 'Mode_switch=Escape'

i3-msg workspace 2
i3-msg move workspace to output dp-2

i3-msg workspace 3
i3-msg move workspace to output dp-1
