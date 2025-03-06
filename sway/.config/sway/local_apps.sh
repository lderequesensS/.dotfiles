#!/usr/bin/env -S bash -e

apps=$(find $HOME/.local/share/applications -name '*.desktop' -type f)
apps="${apps// /\n}"
apps="${apps//$HOME\/.local\/share\/applications\/}"

echo "$apps"
