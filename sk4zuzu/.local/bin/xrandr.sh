#!/usr/bin/env bash

# Improve error handling.
set -o errexit -o nounset -o pipefail

if [[ -f /sys/class/drm/card0/device/power_dpm_force_performance_level ]]; then
    echo low \
    | sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level
fi

if [[ -f /sys/class/backlight/amdgpu_bl0/brightness ]]; then
    cat /sys/class/backlight/amdgpu_bl0/max_brightness \
    | sudo tee /sys/class/backlight/amdgpu_bl0/brightness
else
    if which xbacklight; then
        xbacklight -set 100 || true
    fi
fi

if which hsetroot; then
    hsetroot -solid "#000000"
fi

if which xrandr; then
    if xrandr | grep "eDP"; then
        xrandr --output "eDP" --auto
        if xrandr | grep "HDMI-A-0"; then
            xrandr --output "HDMI-A-0" --auto --left-of "eDP"
            xrandr --output "HDMI-A-0" --primary
        fi
    fi
fi
