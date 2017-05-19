#!/bin/bash
cd "$HOME/code/canvas-lms" || exit
tmux new -d -s canvas

tmux send-keys "pg" C-m
tmux rename-window "pg"

tmux new-window -n "rails"
tmux send-keys "bundle exec rails s -b 0.0.0.0" C-m

tmux new-window -n "worker"
tmux send-keys "bundle exec script/delayed_job run" C-m

tmux new-window -n "shell"
