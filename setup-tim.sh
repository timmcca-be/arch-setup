#!/bin/bash
set -e

mkdir -p ~/arch-setup-tmp

echo ". ~/arch-setup/scripts/bashrc.sh" > ~/.bashrc

~/arch-setup/install-from-aur.sh

mkdir -p ~/.config/Code/User
ln -s ~/arch-setup/files/settings.json ~/.config/Code/User/settings.json
code --install-extension bierner.github-markdown-preview
code --install-extension esbenp.prettier-vscode
code --install-extension Hyzeta.vscode-theme-github-light

git config --global user.email "me@timmcca.be"
git config --global user.name "Tim McCabe"

ssh-keygen -N "" -f ~/.ssh/id_rsa

echo
echo "add this key to github:"
cat ~/.ssh/id_rsa.pub

echo
read -p "press any key when done " -n 1 -r
echo

cd ~/arch-setup
git remote remove origin
git remote add origin git@github.com:timmcca-be/arch-setup.git
git pull
git branch -u origin/main

sudo netctl stop-all
sudo systemctl start NetworkManager
nohup nm-applet &
