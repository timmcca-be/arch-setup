#!/bin/bash
set -e

pacman -S --noconfirm --needed xorg-server xorg-xinit xterm lightdm lightdm-gtk-greeter xfce4 lightdm-webkit2-greeter lightdm-webkit-theme-litarvan

read -p "touchpad? [yN] " -n 1 -r touchpad
echo
if [[ $touchpad =~ ^[Yy]$ ]]
then
    pacman -S --noconfirm --needed xf86-input-synaptics
fi

read -p "video driver? [i:intel/a:amd/n:nvidia/S:skip] " -n 1 -r video_driver
echo
if [[ $video_driver =~ ^[Ii]$ ]]
then
    pacman -S --noconfirm --needed xf86-video-intel mesa lib32-mesa
elif [[ $video_driver =~ ^[Aa]$ ]]
then
    pacman -S --noconfirm --needed xf86-video-amdgpu mesa lib32-mesa
elif [[ $video_driver =~ ^[Nn]$ ]]
then
    pacman -S --noconfirm --needed nvidia nvidia-utils lib32-nvidia-utils
else
    echo "assuming that you already installed video drivers"
fi

cp ~/arch-setup/files/lightdm.conf /etc/lightdm/lightdm.conf
cp ~/arch-setup/files/lightdm-webkit2-greeter.conf /etc/lightdm/lightdm-webkit2-greeter.conf

mkdir -p /var/lib/lightdm/.local/share/webkitgtk
cp -r ~/arch-setup/files/localstorage /var/lib/lightdm/.local/share/webkitgtk/localstorage

systemctl enable lightdm
