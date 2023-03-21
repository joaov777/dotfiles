#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sourcing necessary packages
. "$SCRIPT_DIR"/../misc/menus.sh
. "$SCRIPT_DIR"/../misc/functions.sh

subMenu "Dotfiles" "Install AUR Helper" 

	[ installYayHelper ] && echo "|--> Yay successfully installed!" || echo "|--> Yay not installed!" ; sleep 3
	clear