#!/bin/bash

index=$(jq 'to_entries | .[] | "[\(.key)] - \(.value)" | gsub("\n";"\\n")' \
    --raw-output "$HOME/clips.json" \
    | fzf \
    | sed -r 's/^\[([0-9]).*/\1/')

if [ -n "$index" ]
then
    temp=$(mktemp)
    cp "$HOME/clips.json" "$temp"
    jq "del(.[$index])" "$temp" > "$HOME/clips.json"
    jq ".[$index]" --raw-output "$temp" | xclip -selection clipboard
    rm "$temp"
fi
