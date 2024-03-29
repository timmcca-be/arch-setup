#!/bin/bash
set -e

pacman -S --noconfirm --needed \
    firefox \
    gparted \
    ntfs-3g \
    networkmanager \
    network-manager-applet \
    jq \
    unzip \
    sqlite \
    vim \
    pulseaudio \
    xfce4-pulseaudio-plugin \
    archlinux-keyring
