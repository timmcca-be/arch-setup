#!/bin/bash
set -e

# finding settings:
# https://forum.xfce.org/viewtopic.php?id=10836

xfconf-query -c xfwm4 -p /general/raise_with_any_button -s false

xfconf-query -c xsettings -p /Gtk/CursorThemeName -s Breeze_Snow
