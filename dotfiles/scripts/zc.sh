#!bin/bash

C_DIR="$HOME/.config/"

c=$(find "$C_DIR" -mindepth 1 -maxdepth 1 -type d | fzf --prompt="Configs> ")

[ -z "$c" ] && return

c_name=$(basename "$c")

if tmux has-session -t "$c_name" 2>/dev/null; then
    tmux attach-session -t "$c_name"
else
    cd "$c"
    tmux new-session -s "$c_name"
fi

