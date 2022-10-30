#!/bin/bash
set -e

mkdir -p ~/arch-setup-tmp

~/arch-setup/scripts/connect-to-internet.sh

cp ~/arch-setup/files/pacman.conf /etc/pacman.conf
pacman -Sy
~/arch-setup/scripts/set-up-gui.sh
~/arch-setup/scripts/install-programs.sh
~/arch-setup/scripts/install-cascadia-code.sh

mkdir -p /usr/share/icons/default
cp ~/arch-setup/files/index.theme /usr/share/icons/default/index.theme

useradd -m tim
echo "set tim's password"
passwd tim

cp ~/arch-setup/files/sudoers /etc/sudoers

cp -r ~/arch-setup /home/tim/arch-setup
chown tim /home/tim/arch-setup

echo
echo "run:"
echo "# systemctl start lightdm"
echo "then, sign in as tim and run:"
echo "$ ~/arch-setup/setup-tim.sh"
