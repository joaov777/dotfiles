#!/bin/bash

. ~/dotfiles/scripts/misc/menus.sh
. ~/dotfiles/scripts/misc/functions.sh

subMenu "Dotfiles" "Install AUR Helper" 

	[ installYayHelper ] && echo "|--> Yay successfully installed!" || echo "|--> Yay not installed!" ; sleep 3
	clear
