#!/bin/zsh
set -e

cp -r ~/arch-setup /mnt/root/arch-setup

# 2.1
~/arch-setup/build-mirrorlist.sh

# 2.2
pacstrap -K /mnt base base-devel linux linux-firmware nano netctl dialog wpa_supplicant dhcpcd

# 3.1
genfstab -U /mnt >> /mnt/etc/fstab

# 3.4 (start)
cp ~/arch-setup/files/locale.gen /mnt/etc/locale.gen

echo
echo 'run:'
echo '# arch-chroot /mnt'
echo '# ~/arch-setup/install-chroot.sh'
