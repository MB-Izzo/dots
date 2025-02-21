#!/usr/bin/env bash
# This script allow us to find a flatpak app and create a symlink in /usr/bin 
# in order for dmenu to access it.

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find /var/lib/flatpak/exports/bin | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected")

read -p "What name should it have on dmenu: " query

sudo ln -s /var/lib/flatpak/exports/bin/$selected_name /usr/bin/$query

echo "Done!"
