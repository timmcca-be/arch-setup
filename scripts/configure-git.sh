#!/bin/bash
set -e

git config --global user.email "me@timmcca.be"
git config --global user.name "Tim McCabe"

ssh-keygen -N "" -f ~/.ssh/id_rsa

echo
echo "public key:"
cat ~/.ssh/id_rsa.pub

echo
read -p "if you want to configure github, add this key to your account and press y. otherwise, press n. [yN] " -n 1 -r set_up_github
echo

if [[ ! $set_up_github =~ ^[Yy]$ ]]
then
    exit
fi

cd ~/arch-setup
git remote remove origin
git remote add origin git@github.com:timmcca-be/arch-setup.git
git fetch --all
git branch -u origin/main
