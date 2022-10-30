#!/bin/zsh
set -e

curl -s 'https://archlinux.org/mirrorlist/?country=US&protocol=http&protocol=https&ip_version=4' | sed 's/#Server/Server/g' > /etc/pacman.d/mirrorlist
