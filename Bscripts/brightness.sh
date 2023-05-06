#!/bin/bash

# Change brightness level with `light`.
# You can call this script like this:
# brightness.sh [up|down]

function get_brightness {
    var=`xbacklight -get`
    echo "${var##* }" | sed 's/[^0-9][^.]*//g'
}

function send_notification {
    DIR=`dirname "$0"`
    brightness=`get_brightness`
    icon_name="${HOME}/.config/rice_assets/Icons/b.png"

    # Send the notification
    dunstify "亮度: $brightness%" -h int:value:$brightness -i "$icon_name" -t 1000 --replace=555 -u critical
}

case $1 in
    up)
    	# Raise the brightness (+ 5%)
	    xbacklight -inc 5 $brightness  > /dev/null
	    send_notification
	;;
    down)
        # Lower the brightness (- 5%)              
        xbacklight -dec 5 > /dev/null
	    send_notification
	;;
esac
