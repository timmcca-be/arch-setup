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

# 3.2
arch-chroot /mnt

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
cd root
echo 'set up a bootloader, reboot into the system, then run:'
echo '$ ~/arch-setup/setup.sh'
