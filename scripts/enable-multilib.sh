#!/bin/bash

sed -i -z 's/#\[multilib\]\n#/[multilib]\n/' /etc/pacman.conf
pacman -Sy
