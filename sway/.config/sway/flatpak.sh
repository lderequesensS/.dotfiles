#!/usr/bin/env -S bash -e

app=$(flatpak list --app --columns=name,application | sort -n | grep -i "$1" | awk '{print $2}')

echo "$app"
