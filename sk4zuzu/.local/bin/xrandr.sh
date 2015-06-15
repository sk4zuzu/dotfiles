#!/usr/bin/env bash

if which xrandr; then
    if xrandr|grep eDP1; then
        xrandr --output eDP1 --auto
        if xrandr|grep HDMI1; then
            xrandr --output HDMI1 --mode 1920x1080 --right-of eDP1
        fi
    fi
fi

if which xbacklight; then
    xbacklight = 85%
fi

# vim:ts=4:sw=4:et:
