#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sourcing necessary packages
. "$SCRIPT_DIR"/../misc/menus.sh
. "$SCRIPT_DIR"/../misc/functions.sh

SUDOERS="/etc/sudoers.bak"

clear
        
	subMenu "Dotfiles" "Set up permissions for user $USER"
	
	echo "|--> Creating backup sudoers file at $SUDOERS" 
	[ -f "$SUDOERS" ] || sudo cp /etc/sudoers /etc/sudoers.bak 

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

	echo "|--> Setting git credentials"
	git config --local user.email joaov777@gmail.com
	git config --local user.name joaov777

