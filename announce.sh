#!/bin/bash

speak() {
    OLD_VOLUME=$(osascript -e 'output volume of (get volume settings)')
    osascript -e "set volume output volume 100"
    echo "$1"
    say "$1"
    osascript -e "set volume output volume $OLD_VOLUME"
}

if [ $# -lt 2 ]; then
    echo 'Usage: ./announce.sh [thing] [minutes]'
    exit 0
fi

THING=$1
MINUTES=$2

speak "$THING in $MINUTES minutes, $(date -v +${MINUTES}M +"%H:%M")"

# OS X doesn't support 'sleep 5m'.
sleep $(($MINUTES * 60))

speak "$THING now!"

# announce.sh --- Announce something in Mac OS X
# Copyright (C) 2013  kennytm
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program.  If not, see <http://www.gnu.org/licenses/>.

