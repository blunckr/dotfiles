#!/bin/bash
cd "$HOME/code/act" || exit
tmux new -d -s act

tmux send-keys "sudo nginx" C-m
tmux rename-window "nginx"

tmux new-window -n "redis"
tmux send-keys "redis-server" C-m

tmux new-window -n "rails"
tmux send-keys "rails s -p 3040" C-m

tmux new-window -n "sidekiq"
tmux send-keys "sidekiq" C-m

tmux new-window -n "yarn"
tmux send-keys "yarn hot" C-m

tmux attach-session -t act

