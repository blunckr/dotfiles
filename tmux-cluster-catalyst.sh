#!/bin/bash
cd "$HOME/code/cluster-setup-catalyst" || exit
tmux new -d -s cluster-catalyst

tmux send-keys "squid -N" C-m
tmux rename-window "squid"

tmux new-window -n "network"
tmux send-keys "sudo ./public-routing" C-m

tmux new-window -n "monitor"
tmux send-keys "vagrant up; vagrant ssh monitor" C-m

tmux new-window -n "vim"
tmux send-keys "vim ." C-m

tmux new-window -n "shell"

tmux a -t cluster-catalyst
