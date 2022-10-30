#!/bin/bash
set -e

read -p "connection type? [w:wifi/e:ethernet/S:skip] " -n 1 -r connection_type
echo
if [[ $connection_type =~ ^[Ww]$ ]]
then
    wifi-menu
elif [[ $connection_type =~ ^[Ee]$ ]]
then
    ip link
    read -p "interface name? " ethernet_interface
    export ethernet_interface
    cat ~/arch-setup/files/ethernet-template | envsubst > /etc/netctl/$ethernet_interface
    netctl start $ethernet_interface
else
    echo "not connecting to internet"
    exit
fi

while ! ping -c 1 archlinux.org
do
    echo "waiting for connection"
    sleep 1
done
