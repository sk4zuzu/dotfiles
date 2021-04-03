#!/usr/bin/env sh

export TERM='xterm-256color'
export LANG='en_US.UTF-8'
export EDITOR='nvim'

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/_git/sk4zuzu-nix/asd-flk/result:$PATH"

if [ -e "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi
