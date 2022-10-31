#!/bin/bash
set -e

# finding settings:
# https://forum.xfce.org/viewtopic.php?id=10836

killall xfconfd

cp ~/arch-setup/files/xfce4-panel.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
cp ~/arch-setup/files/whiskermenu-8.rc ~/.config/xfce4/panel/whiskermenu-8.rc
cp ~/arch-setup/files/docklike-22.rc ~/.config/xfce4/panel/docklike-22.rc

xfconf-query -c xfwm4 -p /general/raise_with_any_button -s false --create -t bool
xfconf-query -c xfwm4 -p /general/mousewheel_rollup -s false --create -t bool
xfconf-query -c xfwm4 -p /general/show_dock_shadow -s false --create -t bool
xfconf-query -c xfwm4 -p /general/button_layout -s '|HMC' --create -t string
xfconf-query -c xfwm4 -p /general/theme -s Arc-Dark --create -t string

xfconf-query -c xsettings -p /Gtk/CursorThemeName -s Breeze_Snow --create -t string
xfconf-query -c xsettings -p /Net/ThemeName -s Arc-Dark --create -t string
xfconf-query -c xsettings -p /Net/IconThemeName -s Papirus-Dark --create -t string

xfconf-query -c xfce4-session -p /general/LockCommand -s "dm-tool lock" --create -t string

xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-home -s false --create -t bool
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-filesystem -s false --create -t bool
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-trash -s false --create -t bool
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-removable -s false --create -t bool

xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/Super_L -s xfce4-popup-whiskermenu --create -t string

xfce4-panel -r
