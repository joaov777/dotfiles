#!/bin/bash
. ~/dotfiles/scripts/misc/menus.sh

    #menu
	subMenu "Dotfiles" "Update System" 
    sudo pacman -Syyuu --noconfirm --needed
