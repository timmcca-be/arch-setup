#!/bin/bash
set -e

mkdir -p ~/arch-setup-tmp

~/arch-setup/install-from-aur.sh

mkdir -p ~/.config/Code/User
cp ~/arch-setup/files/settings.json ~/.config/Code/User/settings.json
code --install-extension bierner.github-markdown-preview
code --install-extension esbenp.prettier-vscode
code --install-extension Hyzeta.vscode-theme-github-light

git config --global user.email "me@timmcca.be"
git config --global user.name "Tim McCabe"

ssh-keygen -N "" -f ~/.ssh/id_rsa

echo
echo "add this key to github:"
cat ~/.ssh/id_rsa.pub
