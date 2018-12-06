#!/usr/bin/env sh

export TERM='xterm'
export LANG='en_US.UTF-8'

export EDITOR='vim'

export NPM_PACKAGES="$HOME/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export PATH="$NPM_PACKAGES/bin:$PATH"

if [ -e "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# vim:ts=4:sw=4:et:syn=sh:
