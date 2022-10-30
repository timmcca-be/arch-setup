# arch setup

do [pre-installation](https://wiki.archlinux.org/title/installation_guide#Pre-installation), then

```
cd ~
pacman -Sy git
git clone https://github.com/timmcca-be/arch-setup.git
~/arch-setup/install-iso.sh
```

then

```
arch-chroot /mnt
~/arch-setup/install-chroot.sh
```

set up a bootloader, reboot into the system, sign in as `root`, make sure you are online, then

```
~/arch-setup/setup.sh
```
