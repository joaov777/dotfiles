#!/bin/bash
. ~/dotfiles/scripts/misc/menus.sh
. ~/dotfiles/scripts/misc/functions.sh

SUDOERS="/etc/sudoers.bak"

clear
        
	subMenu "Dotfiles" "Set up permissions for user $USER"
	
	echo "|--> Creating backup sudoers file at $SUDOERS" && sudo cp /etc/sudoers /etc/sudoers.bak 
	echo "|--> Allowing root permissions for $USER (adding to sudoers file)" && 
		[ $(id -u) != 0 ] && {
    		sudo bash -c "echo '$(whoami) ALL=(ALL) ALL' >> /etc/sudoers"
		} || {
    		echo "$(whoami) ALL=(ALL) ALL" >> /etc/sudoers
		}

	echo "|--> Adding sudo group to $USER" && usermod -aG sudo $USER
	
	# if arch based
	[ -f "/etc/arch-release" ] && {
		echo "|--> Adding wheel group and updating sudoers for user $USER"
		sudo sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers
		sudo usermod -aG wheel $USER
	}


