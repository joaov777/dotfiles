#!/bin/bash
. ~/mainconf/scripts/menus.sh

    #menu
	subMenu "MAINCONF - i3" "Update System" 
    sudo pacman -Syyuu --noconfirm --needed
