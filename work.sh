#!/bin/sh
xrandr \
    --output eDP-1 --primary --mode 1920x1080 --pos 0x120 --rotate normal \
    --output DP-1 --mode 1920x1200 --pos 3840x0 --rotate normal \
    --output HDMI-1 --off \
    --output DP-2 --mode 1920x1200 --pos 1920x0 --rotate normal \
    --output HDMI-2 --off

xset r rate 300 25
xmodmap ~/dotfiles/xmodmap

i3-msg workspace 1
i3-msg move workspace to output edp-1

i3-msg workspace 2
i3-msg move workspace to output dp-2

i3-msg workspace 10
i3-msg move workspace to output dp-1
i3-msg workspace 3
i3-msg move workspace to output dp-1

pactl set-default-sink alsa_output.usb-0c76_USB_PnP_Audio_Device-00.analog-stereo
pactl set-default-source alsa_input.usb-0c76_USB_PnP_Audio_Device-00.mono-fallback

feh --randomize --bg-fill ~/wallpapers/*
