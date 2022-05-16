#!/bin/bash
set -e

default=4000
interval=500

temp=$default
turn_off=0

if [ -f /tmp/colortemp ]; then
    temp=$(cat /tmp/colortemp)
fi

case "$1" in
    "up"   ) temp=$((temp+=interval)) ;;
    "down" ) temp=$((temp-=interval)) ;;
    "off"  ) turn_off=1 ;&
    *      ) temp=$default ;;
esac

if (( turn_off )); then
    redshift -x
else
    redshift -O "$temp" -P
fi

echo "$temp" > /tmp/colortemp
