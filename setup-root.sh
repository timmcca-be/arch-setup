#!/bin/bash
set -e

mkdir -p ~/arch-setup-tmp

cp ~/arch-setup/files/pacman.conf /etc/pacman.conf
pacman -Sy
~/arch-setup/scripts/set-up-gui.sh
~/arch-setup/scripts/install-programs.sh
~/arch-setup/install-cascadia-code.sh

useradd -m tim
echo "set tim's password"
passwd tim

cp ~/arch-setup/sudoers /etc/sudoers

cp -r ~/arch-setup /home/tim/arch-setup
chown tim /home/tim/arch-setup

echo
echo "run:"
echo "# systemctl start lightdm"
echo "then, sign in as tim and run:"
echo "$ ~/arch-setup/setup-tim.sh"
