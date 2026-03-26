#!/bin/bash

WALLPAPER_DIR="$HOME/wallpapers/art"
INTERVAL=300

#Checks if the dir exists
if [[ ! -d "$WALLPAPER_DIR" ]]; then
  echo "Dir $WALLPAPER_DIR not found"
  exit 1
fi

#Checks if swww daemon it's running
if ! pgrep -x "awww-daemon" >/dev/null; then
  swww-daemon &
  sleep 1
fi

#Infinite loop that changes the wallpaper each $INTERVAL
while true; do
  # Gets all images from the directory in random order
  WALLPAPERS=($(find "$WALLPAPER_DIR" -type f -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" | shuf))

  #If no files found
  if [[ ${#WALLPAPERS[@]} -eq 0 ]]; then
    echo "No imagem found in $WALLPAPER_DIR"
    exit 1
  fi

  #Iterates through wallpapers
  for WALL in "${WALLPAPERS[@]}"; do
    awww img "$WALL" --transition-type fade --transition-duration 1
    wal -i "$WALL" -n
    pkill -SIGUSR2 waybar
    sleep "$INTERVAL"
  done
done
