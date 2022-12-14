#!/bin/bash
set -e

mkdir -p ~/arch-setup/tmp

# 3.3
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc

# 3.4 (end)
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

# 3.5
echo tim > /etc/hostname

# 3.6
mkinitcpio -P

# 3.7
echo "set the root password"
passwd

# 3.8
~/arch-setup/scripts/set-up-refind.sh

~/arch-setup/scripts/install-microcode.sh

echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist.conf

echo
echo 'reboot into the system, then run:'
echo '# ~/arch-setup/setup.sh'
