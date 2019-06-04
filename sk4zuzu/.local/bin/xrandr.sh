#!/usr/bin/env bash

if which xrandr; then
    if xrandr | grep "eDP-1"; then
        xrandr --output "eDP-1" --auto
        if xrandr | grep "HDMI-1"; then
            xrandr --output "HDMI-1" --mode "1920x1080" --right-of "eDP-1"
        fi
    fi
fi

# vim:ts=4:sw=4:et:syn=sh:
