#!/bin/bash

players=$(playerctl -l)

for player in $players; do

  [ "$(playerctl --player=$player status 2>/dev/null)" != "Playing" ] && continue
  playerctl metadata --player=$player --format "{{artist}} - {{title}}"
done
