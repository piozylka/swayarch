#!/usr/bin/env sh

# Toggle floating dropdown terminal in Sway, or start if non-existing.
# $1 is	the script run in the terminal.
# All other args are terminal settings.
# Terminal names are in Dropdown $script to allow easily setting Sway settings.

[ -z "$1" ] && exit

script=$1
shift

if swaymsg -t get_tree | grep "Dropdown $script";
then
	echo "Window detected."
	swaymsg "[title=\"Dropdown $script\"] scratchpad show; [title=\"Dropdown $script\"] move position center"
else
	echo "Window not detected... spawning."
	if [ $script = "Calculator" ]
	then
		swaymsg exec "kitty --title \"Dropdown $script\" bc"
	else
		swaymsg exec "kitty --title \"Dropdown $script\" "
	fi
	sleep 1
	swaymsg "[title=\"Dropdown $script\"] move scratchpad"
fi