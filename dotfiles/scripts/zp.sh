#!bin/bash

P_DIR="$HOME/projects/"

p=$(find "$P_DIR" -mindepth 1 -maxdepth 1 -type d | fzf --prompt="Projects> ")

[ -z "$p" ] && return

p_name=$(basename "$p")

if tmux has-session -t "$p_name" 2>/dev/null; then
    tmux attach-session -t "$p_name"
else
    cd "$p"
    tmux new-session -s "$p_name"
fi
