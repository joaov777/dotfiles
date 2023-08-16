#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sourcing necessary packages
. "$SCRIPT_DIR"/../menus.sh
. "$SCRIPT_DIR"/../functions.sh

	subMenu "Dotfiles" "Update System" 
    sudo pacman -Syyuu --noconfirm --needed
