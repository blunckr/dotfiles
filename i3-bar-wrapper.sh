#!/bin/bash
sections="[]"
function set_sections {
    if cmus-remote -C
    then
        artist=$(cmus-remote -Q | sed -n "s/^tag artist \(.*\)/\1/p")
        song=$(cmus-remote -Q | sed -n "s/^tag title \(.*\)/\1/p")
        text="$artist - $song"
    elif pidof pianobar
    then
        read -r artist < /tmp/pianobar-artist
        read -r song < /tmp/pianobar-song
        text="$artist - $song"
    else
        text="No Music"
    fi

    sections=$(echo '[{"name": "music"}]' |\
        jq -c --arg text "$text" '.[0].full_text=$text')
}

i3status | {
    # first three lines are different than the rest, ignore them
    read l # version line
    echo "$l"
    read l # [
    echo "$l"
    read l # first line of json without leading comma
    echo "$l"

    while :
    do
        read line
        set_sections > /dev/null 2>&1
        json=$(echo "${line:1}" |\
            jq -c --argjson sections "$sections" '$sections + .')
        echo ",$json" || exit 1
    done
}
