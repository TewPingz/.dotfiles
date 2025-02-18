#!/bin/bash
xrandr --output DP-2 --mode 5120x1440 --primary --scale 1x1 --pos 0x0 --panning 5120x1440 \
&& xrandr --output DP-2 --setmonitor Monitor2 1280/298x1440/340+0+0 DP-2 \
&& xrandr --output DP-2 --setmonitor Monitor1 2560/595x1440/340+1280+0 none \
&& xrandr --output DP-2 --setmonitor Monitor3 1280/297x1440/340+3840+0 none
