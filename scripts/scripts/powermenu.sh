#!/bin/bash

chosen=$(echo -e "󰐥 Turn off\n󰑓 Reboot\n󰍃 Log Out" | rofi -dmenu -theme ~/scripts/nord.rasi)

case "$chosen" in
"󰐥 Turn off") systemctl poweroff ;;
"󰑓 Reboot") systemctl reboot ;;
"󰍃 Log out") hyprctl dispatch exit ;;
esac
