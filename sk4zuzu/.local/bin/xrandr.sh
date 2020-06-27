#!/usr/bin/env bash

# Improve error handling.
set -o errexit -o nounset -o pipefail

if which xbacklight; then
    xbacklight -set 100
fi

if which hsetroot; then
    hsetroot -solid "#000000"
fi

if which xrandr; then
    if xrandr | grep "eDP1"; then
        xrandr --output "eDP1" --auto
        if xrandr | grep "HDMI1"; then
            xrandr --output "HDMI1" --auto --left-of "eDP1"
            xrandr --output "HDMI1" --primary
        fi
    fi
fi

# vim:ts=4:sw=4:et:syn=sh:
