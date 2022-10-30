#!/bin/bash
set -e

# finding settings:
# https://forum.xfce.org/viewtopic.php?id=10836

ln -sf ~/arch-setup/files/xfce4-panel.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
# copy this instead of linking, since recently used apps are stored here
cp ~/arch-setup/files/whiskermenu-8.rc ~/.config/xfce4/panel/whiskermenu-8.rc
ln -sf ~/arch-setup/files/docklike-22.rc ~/.config/xfce4/panel/docklike-22.rc

xfconf-query -c xfwm4 -p /general/raise_with_any_button -s false
xfconf-query -c xfwm4 -p /general/mousewheel_rollup -s false
xfconf-query -c xfwm4 -p /general/show_dock_shadow -s false
xfconf-query -c xfwm4 -p /general/button_layout -s '|HMC'
xfconf-query -c xfwm4 -p /general/theme -s Arc-Dark

xfconf-query -c xsettings -p /Gtk/CursorThemeName -s Breeze_Snow
xfconf-query -c xsettings -p /Net/ThemeName -s Arc-Dark
xfconf-query -c xsettings -p /Net/IconThemeName -s Papirus-Dark

xfconf-query -c xfce4-session -p /general/LockCommand -s "dm-tool lock"

xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-home -s false
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-filesystem -s false
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-trash -s false
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-removable -s false
