#!/bin/bash

killall polybar

MONITOR="Monitor2" polybar -c ~/.config/polybar/config.ini left &
MONITOR="Monitor1" polybar -c ~/.config/polybar/config.ini mid &
MONITOR="Monitor3" polybar -c ~/.config/polybar/config.ini right &

