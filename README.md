# Bspwm-1920x1080 
自己由[这个](https://github.com/ikz87)魔改的Bspwm配置文件
## 配置效果
[!image]https://user-images.githubusercontent.com/127640546/236631773-1d7e43fb-2187-4e8b-8be4-8d02ce575b67.png

https://user-images.githubusercontent.com/127640546/236632066-05578a44-4bea-4fc2-bf06-e7a0a3883cae.mp4



## 安装依赖
### 万物平等：安装pop_report
- [pop_report(作者ikz87)](https://github.com/ikz87/pop_report)
- 将这个仓库克隆下来
```
git clone https://github.com/ikz87/pop_report
```
- 进入文件夹
```
cd pop_report
```
- 把里面的二进制命令文件(pop_report)复制到/usr/bin目录下(需要超级用户权限)
```
sudo cp ./pop_report "/usr/bin"
```
- 使pop_report可执行(同样要超级用户权限)
```
sudo chmod 755 /usr/bin/pop_report
```
### 如果你是Arch或Manjaro等Arch衍生版Linux用户，则除了pop_report以外可以使用AUR安装(假设你使用yay)
```
yay -Sy acpi acpilight alacritty alsa-utils battery blueman bottom bspwm btop cava colorpicker clipmenu dunst eww-bin flameshot google-chrome gotop hsetroot htop imagemagick jq kitty lxappearance mantablockscreen mpv network-manager-applet neovim pa-applet-git picom-ftlabs-git playerctl polkit-gnome polybar pulseaudio python3 ranger rofi scrot sd sox spotify spicetify-cli sxhkd sysstat thunar tumbler udiskie wmctrl wpgtk-git xclip xdotool xprintidle xfce4-power-manager xorg xorg-xinit xorg-xwininfo yesplaymusic --needed
```
### 如果你是其他版本的Linux用户，~~请左转换Arch~~以下是依赖列表，请自己用包管理器或自己编译安装
- acpi
- acpilight
- alacritty
- alsa-utils
- battery
- blueman
- bottom
- bspwm
- btop
- cava
- colorpicker
- clipmenu
- dunst
- eww
- flameshot
- google-chrome
- gotop
- hsetroot
- htop
- imagemagick
- jq
- kitty
- lxappearance
- mantablockscreen
- mpv
- network-manager-applet
- neovim
- pa-applet
- picom-ftlabs
- playerctl
- polkit-gnome
- polybar
- pulseaudio
- python3
- ranger
- rofi
- scrot
- sd
- sox
- spotify
- spicetify-cli
- sxhkd
- sysstat
- thunar
- tumbler
- udiskie
- wmctrl
- wpgtk
- xclip
- xdotool
- xprintidle
- xfce4-power-manager
- xorg
- xorg-xinit
- xorg-xwininfo
- yesplaymusic

## 安装dots
- 将这个仓库克隆下来
```
git clone https://github.com/lotrt/dotfiles .dots
```
- 进入.dots文件夹
```
cd .dots
```
- 运行安装程序
```
./install.sh
```
### 如果提示权限不够请执行`chmod +x install.sh`

# 更新配置
### - 更新配置时，无需再次执行安装脚本，只需要切换到配置文件根目录处输入```git pull```回车就行了

# GTK主题切换
1. 运行 `lxappearance`
2. 选择 "FlatColor"
3. 点击 "Apply"(应用)<br/>
![image](https://user-images.githubusercontent.com/127640546/229187457-5fd510ba-d2d4-4a83-baac-ff7274e882d3.png)<br/>
这样，你所有的Gtk应用程序都会使用从壁纸中提取的配色方案

## 生成壁纸配色方案
使用`.bscripts/wallset <path to wallpaper>`来设置你的壁纸才能生成配色方案<br/>如果你经常使用设置壁纸命令可以将`${HOME}/.bscripts`添加进你的`/etc/environment`或`$HOME/.pam_environment`文件内

# 按键绑定
### 使用这个配置文件时，你只需要记住一个快捷键——`super+/`按下这俩键可以告诉你所有的按键及其作用
