#!/usr/bin/env bash


rofi_command="rofi -theme /home/joaoseidel/.config/rofi/rofi_menu/powerlayout.rasi"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="󰿅 Shutdown"
reboot="󰜉 Reboot"
lock="󰌾 Lock"

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        betterlockscreen -l blur
        ;;
esac

