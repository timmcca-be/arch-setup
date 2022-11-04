# arch setup

[partition your disks](https://wiki.archlinux.org/title/installation_guide#Partition_the_disks), [format your partitions](https://wiki.archlinux.org/title/installation_guide#Format_the_partitions), then

```
pacman -Sy git
cd ~
git clone https://github.com/timmcca-be/arch-setup.git
~/arch-setup/install-iso.sh
```

then

```
arch-chroot /mnt
~/arch-setup/install-chroot.sh
```

reboot into the system, sign in as `root`, then

```
~/arch-setup/setup-root.sh
```

then

```
systemctl start lightdm
```

sign in as tim, then

```
~/arch-setup/setup-tim.sh
```
