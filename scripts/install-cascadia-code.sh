#!/bin/bash
set -e

zip_url=$(curl -s 'https://api.github.com/repos/microsoft/cascadia-code/releases/latest' | jq '.assets[0].browser_download_url' | sed 's/"//g')
curl -L $zip_url --output ~/arch-setup/tmp/cascadia.zip
unzip ~/arch-setup/tmp/cascadia.zip -d ~/arch-setup/tmp/cascadia
mkdir -p /usr/local/share/fonts
cp -r ~/arch-setup/tmp/cascadia/ttf/static /usr/local/share/fonts/cascadia
