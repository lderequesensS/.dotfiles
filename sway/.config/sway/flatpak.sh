#!/usr/bin/env -S bash -e

app=$(flatpak list --app --columns=application | sort -n | grep -i "$1")

echo "$app"
