#!/bin/bash

temp=$(grep -o '".*"' /etc/os-release | sed 's/"//g' | head -n 1)
echo "${USER^} 󰍹  $temp"

