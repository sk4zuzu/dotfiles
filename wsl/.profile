#!/usr/bin/env sh

export TERM=xterm-256color
export LANG=en_US.UTF-8
export EDITOR=nvim

export PIP_PREFIX="$HOME/.local"
export PYTHONPATH="$PIP_PREFIX/lib/python3.8/site-packages"
export PATH="$PIP_PREFIX/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

if [ -e "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi
