#!/usr/bin/env sh

export TERM='xterm-256color'
export LANG='en_US.UTF-8'

export EDITOR='vim'

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$HOME/.yarn/bin:$PATH"

export NPM_PACKAGES="$HOME/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

export PYTHONPATH=".venv/lib/python3.7/site-packages:$PYTHONPATH"

export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export PATH="$NPM_PACKAGES/bin:$PATH"

if [ -e "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# vim:ts=4:sw=4:et:syn=sh:
