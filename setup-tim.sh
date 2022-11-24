#!/bin/bash
set -e

mkdir -p ~/arch-setup/tmp

echo ". ~/arch-setup/scripts/bashrc.sh" > ~/.bashrc

mkdir -p ~/.config/xfce4/terminal
ln -sf ~/arch-setup/files/setup-tim/xfce-terminalrc ~/.config/xfce4/terminal/terminalrc

~/arch-setup/scripts/install-yay.sh
~/arch-setup/scripts/install-user-programs.sh

mkdir -p ~/.config/Code/User
ln -sf ~/arch-setup/files/setup-tim/vscode-settings.json ~/.config/Code/User/settings.json
code --install-extension bierner.github-markdown-preview
code --install-extension esbenp.prettier-vscode
code --install-extension Hyzeta.vscode-theme-github-light
code --install-extension svelte.svelte-vscode

~/arch-setup/scripts/configure-xfce.sh
~/arch-setup/scripts/configure-git.sh

sudo netctl stop-all
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
