#!/bin/bash

killall polybar

if ! xrandr | grep "5120x1440"; then 
  polybar laptop &
  exit 1
fi

MONITOR="Monitor2" polybar left &
MONITOR="Monitor1" polybar mid &
MONITOR="Monitor3" polybar right &
