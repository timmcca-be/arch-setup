#!/bin/zsh

cp -r ~/arch-setup /mnt/root

# 2.1
pacman -S --noconfirm wget
wget -O ~/mirrorlist 'https://archlinux.org/mirrorlist/?country=US&protocol=http&protocol=https&ip_version=4'
cat ~/mirrorlist | sed s/\#Server/Server/g > /etc/pacman.d/mirrorlist

# 2.2
pacstrap -K /mnt base base-devel linux linux-firmware nano

# 3.1
genfstab -U /mnt >> /mnt/etc/fstab

# 3.4 (start)
cp ~/arch-setup/locale.gen /mnt/etc/locale.gen

echo 'run:'
echo '# arch-chroot /mnt'
echo '# chmod +x ~/arch-setup/install-chroot.sh'
echo '# ~/arch-setup/install-chroot.sh'
