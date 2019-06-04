#!/bin/bash

export TERM='xterm'

export LANG='en_US.UTF-8'
export EDITOR='vim'

export CFLAGS='-O3 -march=native -mtune=native'
export CXXFLAGS="$CFLAGS"

function join {
    grep . | paste -sd: | tr -d ' '
}

export PKG_CONFIG_PATH=`join <<< "
    $PKG_CONFIG_PATH
"`

export LD_LIBRARY_PATH=`join <<< "
    $LD_LIBRARY_PATH
"`

export PATH=`join <<< "
    .
    $HOME/.local/bin
    $PATH
"`

export MANPATH=`join <<< "
    $MANPATH
"`

unset -f join

if [ -e "$HOME/.bashrc" ]; then
    source $HOME/.bashrc
fi

# vim:ts=4:sw=4:et:
