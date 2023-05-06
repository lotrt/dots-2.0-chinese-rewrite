#!/bin/sh

# Takes a screenshot of the whole screen.
# Screenshot is copied to clipboard and saved to
# ~/Pictures/Screenshots

mkdir -p ~/图片/截图 || true
date=`date +'%Y-%m-%d_%H:%M:%S'` && scrot ~/图片/截图/$date.png -e 'xclip -selection clipboard -target image/png -i $f' && notify-send -u critical -t 3000 -i ~/图片/截图/$date.png "截图已保存"
