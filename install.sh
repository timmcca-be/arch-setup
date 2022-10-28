#!/bin/bash

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

# 3.2
arch-chroot /mnt

# 3.3
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc

# 3.4 (end)
locale-gen