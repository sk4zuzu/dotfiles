#!/usr/bin/env bash

# Improve error handling.
set -o errexit -o nounset -o pipefail

if which slock; then
    #if which xrandr; then
    #    if xrandr | grep "eDP-1"; then
    #        xrandr --output "eDP-1" --off
    #        slock
    #        xrandr.sh
    #        exit 0
    #    fi
    #fi
    slock
    exit 0
fi

# vim:ts=4:sw=4:et:syn=sh:
