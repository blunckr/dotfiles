#!/bin/bash
pipe=/tmp/app-launch-pipe
app=$(compgen -c | "$HOME/.fzf/bin/fzf")
if [ -n "$app" ]
then
    if [[ -p $pipe ]]
    then
        echo "$app" > $pipe
    fi
fi
