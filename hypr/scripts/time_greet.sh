#!/bin/bash 

temp=$(date +%H)
curr_time=$((10#$temp))  # Run date command and store the result as integer

if [[ $curr_time -ge 5 && $curr_time -le 10 ]]; then 
  echo "Good Morning"
elif [[ $curr_time -gt 10 && $curr_time -lt 17 ]]; then 
  echo "Good Afternoon"
elif [[ $curr_time -ge 17 && $curr_time -lt 22 ]]; then 
  echo "Good Evening"
elif [[ $curr_time -ge 22 ]]; then
  echo "Good Night"
else 
  echo "It's getting late..."
fi

