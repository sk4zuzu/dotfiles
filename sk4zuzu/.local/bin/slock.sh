#!/usr/bin/env bash

if which slock; then
    if which xrandr; then
        if xrandr|grep eDP1; then
            xrandr --output eDP1 --off
            slock
            xrandr.sh
            exit 0
        fi
    fi
    slock
    exit 0
fi

# vim:ts=4:sw=4:et:
