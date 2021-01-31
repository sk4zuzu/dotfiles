#!/usr/bin/env sh

export TERM='xterm-256color'
export LANG='en_US.UTF-8'

export EDITOR='vim'

export GOPATH="$HOME/go"

export PATH="$GOPATH/bin:$PATH"

if [ -e "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi
