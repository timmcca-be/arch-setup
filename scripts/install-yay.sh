#!/bin/bash
set -e

cd ~/arch-setup-tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sri
