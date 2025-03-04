#!/usr/bin/env -S bash -e
# Source: https://github.com/rhoot/dotconfig/blob/master/configs/sway/grim.sh

case "$1" in

	"" | "all")
		grim - | swappy -f -
		;;

	"screen")
		output="$(swaymsg --type get_outputs | jq --raw-output 'map(select(.focused == true)) | first.name')"
		grim -o "$output" - | swappy -f -
		;;

	"window")
		region="$(swaymsg -t get_tree | jq --raw-output 'recurse(.nodes[]) | select(.focused == true).rect | "\(.x),\(.y) \(.width)x\(.height)"')"
		grim -g "$region" - | swappy -f -
		;;

	"selection")
		grim -g "$(slurp)" - | swappy -f -
		;;

	"*")
		printf "unknown mode" > /dev/stderr
		;;

esac
