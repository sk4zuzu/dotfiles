#!/usr/bin/env sh

export TERM='xterm'
export LANG='en_US.UTF-8'

export EDITOR='vim'

export GOPATH="$HOME/go"

export PATH="$GOPATH/bin:$HOME/.yarn/bin:$PATH"

if [ -e "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# vim:ts=4:sw=4:et:syn=sh:
