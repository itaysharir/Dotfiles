#! /usr/bin/env sh

export current=$(tmux display-message -p '#I')
export goto=$(expr $current + 1)
skhd -k "ctrl - b"
skhd -k "$goto"
