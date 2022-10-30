#!/bin/bash
set -e

mkdir -p ~/arch-setup-tmp

echo ". ~/arch-setup/scripts/bashrc.sh" > ~/.bashrc

rm ~/.config/xfce4/terminal/terminalrc
ln -s ~/arch-setup/files/terminalrc ~/.config/xfce4/terminal/terminalrc

~/arch-setup/install-from-aur.sh

mkdir -p ~/.config/Code/User
ln -s ~/arch-setup/files/settings.json ~/.config/Code/User/settings.json
code --install-extension bierner.github-markdown-preview
code --install-extension esbenp.prettier-vscode
code --install-extension Hyzeta.vscode-theme-github-light

~/arch-setup/scripts/configure-git.sh

sudo netctl stop-all
sudo systemctl start NetworkManager
nohup nm-applet &
