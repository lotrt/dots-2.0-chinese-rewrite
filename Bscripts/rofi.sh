#!/bin/sh

# This script is used to run rofi with different configurations
# based on desired usage.
# You can call this script like this:
# rofi.sh [drun|config|window|outopts]

roficonf="$HOME/.config/rofi/"

case $1 in 
    drun)    
        rofi -config $roficonf/drun.rasi -show drun
    ;;
    window)
        (rofi -config $roficonf/window.rasi -show windowcd; xdotool keyup Tab)&
        xdotool keyup Tab
        xdotool keydown Tab
    ;;
    run)    
        rofi -config $roficonf/run.rasi -show run
    ;;
    outopts)
#
        option=`printf "\n\n\n⏻\n" | \
        rofi -config $roficonf/logout.rasi -dmenu -p "Select logout" -font "Caskaydia Cove Nerd Font 18"`
        case $option in
            # "")
            #     confirm=`printf "此服务器已禁止重启桌面" | rofi -config $roficonf/logout.rasi -dmenu -font "Nova Mono 15"`
            #     [[ $confirm == "此服务器已禁止重启桌面" ]] && confirm=`printf "此服务器已禁止重启桌面" | rofi -config $roficonf/logout.rasi -dmenu -font "Nova Mono 15"`
            # ;;
            # "")
            #     confirm=`printf "此服务器已禁止登出账户" | rofi -config $roficonf/logout.rasi -dmenu -font "Nova Mono 15"`
            #     [[ $confirm == "此服务器已禁止登出账户" ]] && confirm=`printf "此服务器已禁止登出账户" | rofi -config $roficonf/logout.rasi -dmenu -font "Nova Mono 15"`
            # ;;
            # "")
            #     confirm=`printf "此服务器已禁止重启" | rofi -config $roficonf/logout.rasi -dmenu -font "Nova Mono 15"`
            #     [[ $confirm == "此服务器已禁止重启" ]] && confirm=`printf "此服务器已禁止重启" | rofi -config $roficonf/logout.rasi -dmenu -font "Nova Mono 15"`
            # ;;
            # "⏻")
            #     confirm=`printf "此服务器已禁止关机" | rofi -config $roficonf/logout.rasi -dmenu -font "Nova Mono 15"`
            #     [[ $confirm == "此服务器已禁止关机" ]] && confirm=`printf "此服务器已禁止关机" | rofi -config $roficonf/logout.rasi -dmenu -font "Nova Mono 15"`
						# ;;
            "")
                bspc wm -r
            ;;
            "")
                ~/.config/bspwm/quit.sh
            ;;
            "")
                confirm=`printf "确定重启" | rofi -config $roficonf/logout.rasi -dmenu -font "Nova Mono 15"`
            [[ $confirm == "确定重启" ]] && reboot
            ;;
            "⏻")
                confirm=`printf "确定关机" | rofi -config $roficonf/logout.rasi -dmenu -font "Nova Mono 15"`
                [[ $confirm == "确定关机" ]] && shutdown now
            ;;
        esac
    ;;
esac
