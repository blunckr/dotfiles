#/bin/bash
if [ -e "$HOME/clips.json" ]
then
    old=$(jq '.[0]' "$HOME/clips.json" --raw-output)
else
    old=$(xsel -o -b)
    echo -n "$old" | jq --raw-input --slurp '[.]' > "$HOME/clips.json"
fi

while true
do
    new=$(xsel -o -b)
    if ! [ "$old" = "$new" ]
    then
        temp=$(mktemp)
        jq --arg new "$new" '[$new] + . | .[:20]' "$HOME/clips.json" > "$temp"
        mv "$temp" "$HOME/clips.json"
        old="$new"
    fi
    sleep 0.1
done
