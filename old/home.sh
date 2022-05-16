#!/bin/sh
xrandr \
    --output DP-1 --primary --mode 1920x1200 --pos 0x296 --rotate normal \
    --output HDMI-2 --mode 1920x1200 --pos 1920x0 --rotate right \
    --output eDP-1 --off \
    --output HDMI-1 --off \
    --output DP-2 --off

xmodmap ~/dotfiles/xmodmap

i3-msg workspace 1
i3-msg move workspace to output DP-1

i3-msg workspace 10
i3-msg move workspace to output HDMI-2

i3-msg workspace 2
i3-msg move workspace to output HDMI-2
