#!/bin/bash
intern=eDP1
extern=HDMI-1-1

xrandr --output "$extern" --auto --primary
xrandr --output "$intern" --auto --right-of "$extern"
