#!/bin/bash
set -e

mkdir -p ~/aur
cd ~/aur
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sri
