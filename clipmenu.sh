#!/bin/bash
index=$(jq 'to_entries | .[] | "[\(.key)] - \(.value)" | gsub("\n";"\\n")' \
    --raw-output "$HOME/clips.json" \
    | "$HOME/.fzf/bin/fzf" \
    | sed -r 's/^\[([0-9]).*/\1/')

if [ -n "$index" ]
then
    temp=$(mktemp)
    cp "$HOME/clips.json" "$temp"
    jq "del(.[$index])" "$temp" > "$HOME/clips.json"
    jq ".[$index]" --raw-output "$temp" | xsel -i -b
    rm "$temp"
fi
