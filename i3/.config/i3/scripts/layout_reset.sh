#!/bin/bash

if ! xrandr | grep "5120x1440"; then 
  exit 1
fi

xrandr --output DP-2 --mode 5120x1440 --scale 1x1 --panning 5120x1440
xrandr --delmonitor Monitor1
xrandr --delmonitor Monitor2
xrandr --delmonitor Monitor3
