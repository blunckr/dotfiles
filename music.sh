#!/bin/bash

if cmus-remote -C
then
    case $1 in
        prev) cmus-remote -r;;
        play) cmus-remote -u;;
        next) cmus-remote -n;;
    esac
fi
