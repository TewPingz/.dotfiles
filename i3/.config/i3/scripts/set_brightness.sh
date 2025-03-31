#!/usr/bin/bash
set_brightness() {
    local output
    while read -r -d $'\n' output ; do
        xrandr --output "${output}" --brightness "${1}"
    done < <(xrandr --listactivemonitors | tail +2 | grep -o '[^ ]*$')
}
set_brightness "${@}"
