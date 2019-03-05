#!/bin/sh
xrandr \
    --output HDMI-2 --mode 1920x1200 --pos 0x0 --rotate normal \
    --output HDMI-1 --off \
    --output DP-1 --primary --mode 1920x1200 --pos 1920x0 --rotate normal \
    --output eDP-1 --mode 1920x1080 --pos 3840x352 --rotate normal \
    --output DP-2 --off

xset r rate 300 25
xmodmap ~/dotfiles/xmodmap

i3-msg workspace 3
i3-msg move workspace to output edp-1

i3-msg workspace 2
i3-msg move workspace to output dp-1

i3-msg workspace 1
i3-msg move workspace to output HDMI-2

feh --randomize --bg-fill ~/wallpapers/*
