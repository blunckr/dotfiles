#!/bin/bash

any_players=$(playerctl --list-all | wc -l)

if pidof pianobar
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
        prev) playerctl -p spotify previous;;
        next) playerctl -p spotify next;;
        play)
            if [ "$any_players" == 1 ]
            then
                playerctl play-pause
            elif playerctl status --all-players | grep -q Playing
            then
                playerctl pause --all-players
            else
                player=$(playerctl -l | rofi -dmenu)
                playerctl play -p "$player"
            fi
            ;;
    esac
fi
