#!/bin/bash

read -p "processor manufacturer? [i:intel/a:amd/S:skip] " -n 1 -r processor_manufacturer
echo
if [[ $processor_manufacturer =~ ^[Ii]$ ]]
then
    ucode_package=intel-ucode
elif [[ $processor_manufacturer =~ ^[Aa]$ ]]
then
    ucode_package=amd-ucode
else
    echo "not installing microcode"
    exit
fi

pacman -S --noconfirm --needed $ucode_package

if [[ -f "/boot/refind_linux.conf" ]]
then
    sed -i "/$ucode_package/!s/initrd=/initrd=boot\\\\$ucode_package.img initrd=/" /boot/refind_linux.conf
else
    echo "update your bootloader with the microcode"
fi
