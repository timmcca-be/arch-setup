#!/bin/bash
set -e

. ~/arch-setup/tmp/partitions.sh

if [[ $efi_partition == "" ]]
then
    echo "not using efi, set up your own bootloader"
    exit
fi

pacman -S --noconfirm --needed refind gdisk
refind-install
export partition_uuid=$(blkid | grep $root_partition | sed -E 's/.*UUID="(.*?)".*/\1/')
cat ~/arch-setup/files/set-up-refind/refind_linux_template.conf | envsubst > /boot/refind_linux.conf

cd ~/arch-setup/tmp
git clone https://github.com/bobafetthotmail/refind-theme-regular.git
rm -rf refind-theme-regular/{src,.git}
rm refind-theme-regular/install.sh

rm -rf /boot/efi/EFI/refind/{regular-theme,refind-theme-regular}
rm -rf /boot/efi/EFI/refind/themes/{regular-theme,refind-theme-regular}
mkdir -p /boot/efi/EFI/refind/themes
cp -r refind-theme-regular /boot/efi/EFI/refind/themes/

cp ~/arch-setup/files/set-up-refind/refind.conf /boot/efi/EFI/refind/refind.conf
cp ~/arch-setup/files/set-up-refind/theme.conf /boot/efi/EFI/refind/themes/refind-theme-regular/theme.conf

cp /boot/efi/EFI/refind/themes/refind-theme-regular/icons/128-48/os_win.png /boot/efi/EFI/refind/themes/refind-theme-regular/icons/128-48/os_windows.png
cp /boot/efi/EFI/refind/themes/refind-theme-regular/icons/128-48/os_win.png /boot/efi/EFI/refind/themes/refind-theme-regular/icons/128-48/os_win8.png
cp /boot/efi/EFI/refind/themes/refind-theme-regular/icons/128-48/os_win.png /boot/efi/EFI/refind/themes/refind-theme-regular/icons/128-48/os_win11.png
cp /boot/efi/EFI/refind/themes/refind-theme-regular/icons/256-96/os_win.png /boot/efi/EFI/refind/themes/refind-theme-regular/icons/256-96/os_windows.png
cp /boot/efi/EFI/refind/themes/refind-theme-regular/icons/256-96/os_win.png /boot/efi/EFI/refind/themes/refind-theme-regular/icons/256-96/os_win8.png
cp /boot/efi/EFI/refind/themes/refind-theme-regular/icons/256-96/os_win.png /boot/efi/EFI/refind/themes/refind-theme-regular/icons/256-96/os_win11.png
cp /boot/efi/EFI/refind/themes/refind-theme-regular/icons/384-144/os_win.png /boot/efi/EFI/refind/themes/refind-theme-regular/icons/384-144/os_windows.png
cp /boot/efi/EFI/refind/themes/refind-theme-regular/icons/384-144/os_win.png /boot/efi/EFI/refind/themes/refind-theme-regular/icons/384-144/os_win8.png
cp /boot/efi/EFI/refind/themes/refind-theme-regular/icons/384-144/os_win.png /boot/efi/EFI/refind/themes/refind-theme-regular/icons/384-144/os_win11.png
cp /boot/efi/EFI/refind/themes/refind-theme-regular/icons/512-192/os_win.png /boot/efi/EFI/refind/themes/refind-theme-regular/icons/512-192/os_windows.png
cp /boot/efi/EFI/refind/themes/refind-theme-regular/icons/512-192/os_win.png /boot/efi/EFI/refind/themes/refind-theme-regular/icons/512-192/os_win8.png
cp /boot/efi/EFI/refind/themes/refind-theme-regular/icons/512-192/os_win.png /boot/efi/EFI/refind/themes/refind-theme-regular/icons/512-192/os_win11.png
