#!/usr/bin/env -S bash -e

read app
echo $(grep '^Exec' $HOME/.local/share/applications/$app | sed 's/^Exec=//' | sed 's/%.//')
