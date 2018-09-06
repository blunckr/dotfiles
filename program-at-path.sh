#!/bin/bash
program=$1

if [ -f /tmp/pwd ]
then
    case $program in
    xfce4-terminal ) arg="--working-directory" ;;
    alacritty ) arg="--working-directory" ;;
    kitty ) arg="--directory" ;;
    * ) arg="" ;;
    esac

    $program $arg "$(cat /tmp/pwd)"
else
    $program
fi
