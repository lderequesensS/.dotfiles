#!/usr/bin/env bash

languages=$(echo "golang c cpp typescript rust" | tr " " "\n")
core_utils=$(echo "find xargs sed awk cp git git-worktree chmod chown sed rg grep tmux" | tr " " "\n")

selected=$(echo -e "$languages\n$core_utils" | fzf)
if [[ -z $selected ]]; then
    exit 0
fi

read -p "What do you need?: " query

if echo "$selected" | grep -qs "$languages"; then
    tmux split-window -h bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less"
else
    tmux split-window -h bash -c "curl cht.sh/$selected~$query | less"
fi
