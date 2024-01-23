#! /bin/sh

tmux new-session 'tty-clock -Bcst -C 0' \; \
	split-window -h 'cava' \; \
	split-window -v 'cmatrix -a -b -C black -u 2' \; \
	select-pane -t 0 \; \
	split-window -v 'caffeinate -d' \;

