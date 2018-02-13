#!/bin/bash
if [ -f /tmp/pwd ]
then
    xfce4-terminal --working-directory "$(cat /tmp/pwd)"
else
    xfce4-terminal
fi
