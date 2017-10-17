#!/bin/bash

usage() {
  echo "Usage:"
  echo "$0 [No args]    Sets brightness to default (100)."
  echo "$0 +            Increments brightness by 10."
  echo "$0 -            Decrements brightness by 10."
  echo "$0 Number       Sets brightness to N. Valid range 0 - 100"
}

brightness=$(xrandr --verbose | grep -i brightness | awk '{print $2}')
output=$(xrandr | grep primary | awk '{print $1}')     
step=0.1

case $1 in
  +)brightness=$(echo "scale=2; $brightness + $step" | bc);; 
  -)brightness=$(echo "scale=2; $brightness - $step" | bc);;
  '')brightness=1.0;;
  *)brightness=$(echo "scale=2; $1/100" | bc);;
esac

xrandr --output "$output" --brightness "$brightness"

current_brightness=$(echo "scale=0; $brightness * 100" | bc)
echo "Current brightness = ${current_brightness%.*}"

exit
