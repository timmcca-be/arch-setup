#!/bin/zsh
set -e

blkid
read -p "root partition? " root_partition
export root_partition
read -p "swap partition? " swap_partition
export swap_partition
read -p "efi partition? (enter if none) " efi_partition
export efi_partition

mount $root_partition /mnt
swapon $swap_partition
if [[ $efi_partition != "" ]]
then
    mkdir -p /mnt/boot/efi
    mount $efi_partition /mnt/boot/efi
fi

cat ~/arch-setup/files/mount-devices/partitions-template.sh | envsubst > ~/arch-setup/tmp/partitions.sh
chmod +x ~/arch-setup/tmp/partitions.sh
