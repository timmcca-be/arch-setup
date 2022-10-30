#!/bin/bash
set -e

pacman -S --noconfirm --needed refind gdisk
read -p "efi partition? " efi_partition
mkdir -p /boot/efi
mount $efi_partition /boot/efi
refind-install
read -p "root partition? " root_partition
export partition_uuid=$(blkid | grep $root_partition | sed -E 's/.*UUID="(.*?)".*/\1/')
cat ~/arch-setup/files/refind_linux_template.conf | envsubst > /boot/refind_linux.conf
