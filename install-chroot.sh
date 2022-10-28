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

read -p "set up refind? [Y/n] " -n 1 -r set_up_refind
echo
if [[ ! $set_up_refind =~ ^[Nn]$ ]]
then
    pacman -S refind gdisk
    read -p "efi partition? " efi_partition
    mount $efi_partition /boot/efi
    refind-install
    read -p "root partition? " root_partition
    export partition_uuid=$(blkid | grep $root_partition | sed -E 's/.*UUID="(.*?)".*/\1/')
    cat ~/arch-setup/refind_linux_template.conf | envsubst > /boot/refind_linux.conf
fi


echo
echo 'reboot into the system, then run:'
echo '# ~/arch-setup/setup.sh'
