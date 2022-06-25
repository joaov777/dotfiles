#!/bin/bash
. ~/dotfiles/scripts/misc/menus.sh

	subMenu "Dotfiles" "Update System" 
    sudo pacman -Syyuu --noconfirm --needed
