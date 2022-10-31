#!/bin/zsh
set -e

# 2.1
~/arch-setup/scripts/build-mirrorlist.sh

# 2.2
pacstrap -K /mnt \
    base base-devel linux linux-firmware \
    nano netctl dialog wpa_supplicant dhcpcd \
    man git

# 3.1
genfstab -U /mnt >> /mnt/etc/fstab

# 3.4 (start)
cp ~/arch-setup/files/locale.gen /mnt/etc/locale.gen

cp -r ~/arch-setup /mnt/root/arch-setup

echo
echo 'run:'
echo '# arch-chroot /mnt'
echo '# ~/arch-setup/install-chroot.sh'
