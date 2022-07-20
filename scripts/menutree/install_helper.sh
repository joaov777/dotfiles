#!/bin/bash

. ~/dotfiles/scripts/misc/menus.sh
. ~/dotfiles/scripts/misc/functions.sh

subMenu "Dotfiles" "Install AUR Helper" 

	pacman -S --needed git base-devel && \
	git clone --quiet https://aur.archlinux.org/yay.git /home/"$USER" && \ 
	cd /home/$USER/yay && \
	makepkg -si && \
	rm -rf /home/$USER/yay

	isPackageInstalled yay && sleep 2

	clear