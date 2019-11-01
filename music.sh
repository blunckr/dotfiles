#!/bin/bash

any_players=$(playerctl --list-all | wc -l)

if cmus-remote -C
then
    case $1 in
        prev) cmus-remote -r;;
        play) cmus-remote -u;;
        next) cmus-remote -n;;
    esac
elif pidof pianobar
then
    case $1 in
        play) echo -n 'p' > ~/.config/pianobar/ctl;;
        next) echo -n 'n' > ~/.config/pianobar/ctl;;
    esac
elif [ "$any_players" != 0 ]
then
    case $1 in
        # prev) playerctl -p spotify previous;;
        # play) playerctl -p spotify play-pause;;
        # next) playerctl -p spotify next;;
        prev) playerctl previous;;
        play) playerctl play-pause;;
        next) playerctl next;;
    esac
fi
