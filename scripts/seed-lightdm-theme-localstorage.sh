#!/bin/bash
set -e

mkdir -p /var/lib/lightdm/.local/share/webkitgtk/localstorage

export localstorage_settings=$(cat ~/arch-setup/files/lightdm-theme-settings.json | jq -c)
cat ~/arch-setup/files/localstorage-template.sql | envsubst | sqlite3 /var/lib/lightdm/.local/share/webkitgtk/localstorage/file__0.localstorage
