#!/bin/bash

pacman -S --noconfirm --needed xorg-server xorg-xinit xorg-xinput xorg-xrandr

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
