#!/bin/bash
set -e

pacman -S --noconfirm --needed refind gdisk
blkid
read -p "efi partition? " efi_partition
read -p "root partition? " root_partition
mkdir -p /boot/efi
mount $efi_partition /boot/efi
refind-install
export partition_uuid=$(blkid | grep $root_partition | sed -E 's/.*UUID="(.*?)".*/\1/')
cat ~/arch-setup/files/refind_linux_template.conf | envsubst > /boot/refind_linux.conf
