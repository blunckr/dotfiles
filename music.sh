#!/bin/bash

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
fi
