#!/bin/zsh

pacman -S --noconfirm --needed wget
wget -O ~/mirrorlist 'https://archlinux.org/mirrorlist/?country=US&protocol=http&protocol=https&ip_version=4'
cat ~/mirrorlist | sed s/\#Server/Server/g > /etc/pacman.d/mirrorlist
