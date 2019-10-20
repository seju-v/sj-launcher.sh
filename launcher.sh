#!/bin/sh

# Gathers your last commands and your cache of important stuff
# Format of a choice:
#	TYPE [TAGS] - VALUE
# e.g.	g yt youtube 		- firefox invidio.us
#	d usb			- /mnt/sdb1
#	t update		- sudo pacman -Syu
#	t-vim
choice="$(tail -n 50 ~/.bash_history | sed 's/^/t - /' \
	| cat ~/.data/{custom,apps,dir,files} -\
        | dmenu -l 20)"

ctype="${choice::1}"
cvalue="$(echo $choice | sed 's/[^-]*-[[:space:]]*//')"

# You may choose to handle directories with xdg-open, that's fine

case $ctype in
	# GRAPHICAL APPS
	g) $cvalue ;;

	# TERMINAL COMMANDS
	t) urxvt -e sh -c "$cvalue && $SHELL" ;;

	# DIRECTORIES
	d) urxvt -e sh -c "hunter $cvalue && cd $cvalue && $SHELL" ;;

	# FILES
	f) xdg-open $cvalue
esac
