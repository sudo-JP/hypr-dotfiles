#!/bin/bash

ss_dir="$HOME/Pictures/Screenshots/"
date=$(date '+%d-%m-%Y-%H-%M-%S')

grim -g "$(slurp)" "$ss_dir/$date.png"
wl-copy -t image/png < "$ss_dir/$date.png"
notify-send -i "$ss_dir/$date.png" "Grim" "Screenshot saved" 
