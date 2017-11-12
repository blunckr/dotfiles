#!/bin/bash
cd "$HOME/code/catalyst" || exit
tmux new -d -s catalyst

tmux send-keys "postgres" C-m
tmux rename-window "pg"

tmux new-window -n "elastic"
tmux send-keys "elasticsearch" C-m

tmux new-window -n "elixir"
tmux send-keys "iex -S mix" C-m

tmux new-window -n "vim"
tmux send-keys "vim ." C-m

tmux new-window -n "shell"

tmux attach-session -t catalyst

