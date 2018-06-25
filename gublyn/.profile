#!/usr/bin/env sh

export TERM='xterm'
export LANG='en_US.UTF-8'

export EDITOR='vim'

export PATH="$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin:$PATH"
export MANPATH="$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/share/man/:$MANPATH"

if [ -e "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# vim:ts=4:sw=4:et:syn=sh:
