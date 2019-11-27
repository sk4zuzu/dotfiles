#!/usr/bin/env sh

export TERM='xterm-256color'
export LANG='en_US.UTF-8'

export EDITOR='vim'

if [ -e "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# vim:ts=4:sw=4:et:syn=sh:
