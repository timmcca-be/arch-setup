#!/bin/bash
set -e

rm -rf /var/lib/lightdm/.local/share/webkitgtk/localstorage
mkdir -p /var/lib/lightdm/.local/share/webkitgtk/localstorage

export localstorage_color=$(echo -n '#249cea' | iconv -f UTF-8 -t UTF-16LE | xxd -p | tr -d \\n)
export localstorage_background=$(echo -n 'img/background.b9890328.png' | iconv -f UTF-8 -t UTF-16LE | xxd -p | tr -d \\n)
export localstorage_settings=$(cat ~/arch-setup/files/lightdm-theme-settings.json | jq -c | iconv -f UTF-8 -t UTF-16LE | xxd -p | tr -d \\n)
cat ~/arch-setup/files/localstorage-template.sql | envsubst | sqlite3 /var/lib/lightdm/.local/share/webkitgtk/localstorage/file__0.localstorage
