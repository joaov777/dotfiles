#!/bin/bash

. ~/dotfiles/scripts/misc/menus.sh
. ~/dotfiles/scripts/misc/functions.sh

subMenu "Dotfiles" "Install AUR Helper" 

yay_dir="/home/$USER/yay"

	[ -d "$yay_dir" ] && sudo rm -rf "$yay_dir"
	sudo pacman -S --needed git base-devel && \
	git clone --quiet https://aur.archlinux.org/yay.git "$yay_dir" && cd "$yay_dir" && \
	makepkg -si && \
	rm -rf "$yay_dir"

	isPackageInstalled yay && sleep 2

	clear
