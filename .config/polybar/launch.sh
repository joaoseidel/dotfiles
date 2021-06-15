#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch
MONITOR=eDP1 polybar -c ~/.config/polybar/config launcher &
#MONITOR=eDP1 polybar -c ~/.config/polybar/config songs &
#MONITOR=eDP1 polybar -c ~/.config/polybar/config player &
MONITOR=eDP1 polybar -c ~/.config/polybar/config right &
MONITOR=eDP1 polybar -c ~/.config/polybar/config center &
MONITOR=eDP1 polybar -c ~/.config/polybar/config power &

sleep 3

MONITOR=eDP1 polybar -c ~/.config/polybar/config mask &
