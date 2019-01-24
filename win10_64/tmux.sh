#!/bin/sh

# tmux.sh development
# https://unix.stackexchange.com/questions/80473/how-do-i-run-a-shell-command-from-tmux-conf

tmux has-session -t development
if [ $? != 0 ]; then
    tmux unbind C-b
    tmux send-keys -t development 'set -g prefix C-w' C-m
#    tmux new-session -s development -n editor -d
#    tmux send-keys -t development 'cd /var/www/htdocs/' C-m
#    tmux send-keys -t development 'vim' C-m
    tmux split-window -v -t development
    tmux split-window -v -t development
    tmux select-layout -t development main-horizontal
#   tmux new-window -n console -t development
#   tmux select-window -t development:0
fi
tmux attach -t development

