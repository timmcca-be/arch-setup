#!/bin/bash
set -e

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
