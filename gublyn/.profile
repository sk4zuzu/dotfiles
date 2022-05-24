#!/usr/bin/env sh

export TERM='xterm-256color'
export LANG='en_US.UTF-8'

export EDITOR='nvim'

export GOPATH="$HOME/go"

export PATH="$GOPATH/bin:$PATH"

export PROTOC="$HOME/.nix-profile/bin/protoc"
export PROTOC_INCLUDE="$HOME/.nix-profile/include"

if [ -e "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi
