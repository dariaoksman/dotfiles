#!/bin/bash

usage() {
  echo "Usage: $0 Brightness"
  echo "Brightness    The value to set current brightness to. Valid range 0 - 100"
}

if [ $# -ne 1 ]; then
  usage
  exit 1
fi

brightness=$(printf "%.0f" $(echo "1.87 * $1" | bc))
file="/sys/class/backlight/intel_backlight/brightness"
echo "$brightness" > "$file"
