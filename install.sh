#!/bin/sh

# Some directory names
old="${HOME}/.rice-old"
script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

create_home_dir_tree()
{
    mkdir "$1"/.config || true
    mkdir "$1"/.cache || true
    mkdir -p "$1"/.local/share/fonts || true
}

create_normal_dir_tree()
{
    mkdir -p "$1"/Assets || true
    mkdir -p "$1"/Bscripts || true
    mkdir -p "$1"/Configs || true
    mkdir -p "$1"/Fonts || true
    mkdir -p "$1"/Walcache || true
}

create_backup()
{
    create_normal_dir_tree $old
    echo "完成"

    echo -n "备份当前配置中..."
    mv ~/.config/rice_assets $old/Assets/ 2> /dev/null
    mv ~/.config/nvim $old/Configs/ 2> /dev/null
    mv ~/.config/cava $old/Configs/ 2> /dev/null
    mv ~/.config/mpv $old/Configs/ 2> /dev/null
    mv ~/.config/ranger $old/Configs/ 2> /dev/null
    mv ~/.config/neofetch $old/Configs/ 2> /dev/null
    mv ~/.config/fcitx5 $old/Configs/ 2> /dev/null
    mv ~/.bscripts/ $old/Bscripts/ 2> /dev/null
    mv ~/.config/bspwm $old/Configs/ 2> /dev/null
    mv ~/.config/eww $old/Configs/ 2> /dev/null
    mv ~/.config/dunst $old/Configs/ 2> /dev/null
    mv ~/.config/kitty $old/Configs/ 2> /dev/null
    mv ~/.config/rofi $old/Configs/ 2> /dev/null
    mv ~/.config/pop_report $old/Configs/ 2> /dev/null
    mv ~/.config/wpg $old/Configs/ 2> /dev/null
    mv ~/.config/picom.conf $old/Configs/ 2> /dev/null
    mv ~/.config/rice_assets/ $old/Assets/ 2> /dev/null
    cp ~/.local/share/fonts/* "$script_dir"/Fonts 2> /dev/null
    mv ~/.local/share/fonts/ $old/Fonts 2> /dev/null
    mv ~/.cache/wal/ $old/Walcache/ 2> /dev/null
    echo "完成，你可以在$old/目录下找到配置文件"
}

echo -n "重建用户树"
create_home_dir_tree ${HOME} 2> /dev/null
echo "完成"

echo -n "Creating backup directory tree... "
if [[ -d "$old" ]] 
then
    echo "准备中..."
    echo "警告：在'$old'已有备份"
    echo "你确定要覆盖已有的备份吗(y/N)?"
    read input
    if [[ "$input" == "y" ]] || [[ "$input" == "Y" ]] 
    then
        rm -rf "$old"
        echo -n "重建目录..."
        create_backup
    else
        echo "请在安装前手动删除$old"
        echo "安装终止"
        exit
    fi;
else
    create_backup
fi;


echo -n "正在安装"
for file in `ls "$script_dir"/Configs/`;
do 
    ln -s -f "$script_dir"/Configs/"$file" ${HOME}/.config/ 
done
ln -s -f -T "$script_dir"/Assets ${HOME}/.config/rice_assets
ln -s -f -T "$script_dir"/Bscripts ${HOME}/.bscripts
cp -r -f -T "$script_dir"/Walcache ${HOME}/.cache/wal
ln -s -f -T "$script_dir"/Fonts ${HOME}/.local/share/fonts
echo "完成"

echo  "请提供当前用户密码以安装fcitx5主题"
sudo ln -s -f -T "$script_dir"/Configs/fcitx5/themes/FluentDark "/usr/share/fcitx5/themes"


echo -n "正在安装bspwm配置"
chmod +x ~/.bscripts/*
chmod +x ~/.config/bspwm/autostart
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/quit.sh
chmod +x ~/.config/eww/mybar/scripts/*
chmod +x ~/.config/wpg/wp_init.sh
chmod +x ~/.cache/wal/colors-tty.sh
echo "done"

echo "运行wpg-install脚本以安装gtk主题"
chmod +x "$script_dir"/wpg-install.sh 
"$script_dir"/wpg-install.sh -g 

echo "安装完成"
echo "以后更新时只需要执行git pull就行了"
echo "开始享用吧:)"
