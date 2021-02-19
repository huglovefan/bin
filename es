#!/bin/sh
#
# keep the monitor from turning off
#

export DISPLAY="${DISPLAY:-:0}"
if [ $# -eq 1 -a "$1" = "-1" ]; then
	exec xdg-screensaver reset
fi
if [ $# -gt 0 ]; then
	>&2 echo "usage: ${0##*/} [-1]"
	exit 1
fi
while xdg-screensaver reset && sleep 59; do
	continue
done
