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

set up a bootloader, reboot into the system, sign in as `root`, then

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
