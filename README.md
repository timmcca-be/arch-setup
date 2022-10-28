# arch setup

do [pre-installation](https://wiki.archlinux.org/title/installation_guide#Pre-installation), then

```
pacman -Sy git
git clone https://github.com/timmcca-be/arch-setup.git
chmod +x ~/arch-setup/install-iso.sh
~/arch-setup/install-iso.sh
```

then

```
arch-chroot /mnt
chmod +x ~/arch-setup/install-chroot.sh
~/arch-setup/install-chroot.sh
```

set up a bootloader, reboot into the system, then

```
~/arch-setup/setup.sh
```
