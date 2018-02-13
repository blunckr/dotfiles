#!/bin/bash
pipe=/tmp/app-launch-pipe

trap 'rm -f $pipe' EXIT

if [[ ! -p $pipe ]]
then
    mkfifo $pipe
fi

while true
do
    if read app < $pipe
    then
        "$app" &
        disown
    fi
done
