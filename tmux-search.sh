#!/bin/bash
cd "$HOME/code/catalyst" || exit
tmux new -d -s catalyst

tmux send-keys "postgres" C-m
tmux rename-window "pg"

tmux new-window -n "elastic"
tmux send-keys "elasticsearch" C-m

tmux new-window -n "elixir"
tmux send-keys "IEx -S mix phoenix.server" C-m

tmux new-window -n "vim"
tmux send-keys "vim ." C-m

tmux new-window -n "shell"

tmux -CC attach-session -t catalyst
