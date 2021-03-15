#!/usr/bin/env sh

export TERM='xterm-256color'
export LANG='en_US.UTF-8'

export EDITOR='nvim'

if [ -e "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi
