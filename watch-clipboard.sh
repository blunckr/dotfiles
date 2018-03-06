#/bin/bash
if [ -e "$HOME/clips.json" ]
then
    old=$(jq '.[0]' "$HOME/clips.json" --raw-output)
else
    old=$(xclip -selection clipboard -out)
    echo "$old" | jq --raw-input --slurp '[.]' > "$HOME/clips.json"
fi

while true
do
    new=$(xclip -selection clipboard -out)
    if ! [ "$old" = "$new" ]
    then
        temp=$(mktemp)
        jq --arg new "$new" '[$new] + . | .[:5]' "$HOME/clips.json" > "$temp"
        mv "$temp" "$HOME/clips.json"
        old="$new"
    fi
    sleep 0.1
done
