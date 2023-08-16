#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT_HOME=$(cd $SCRIPT_DIR/../.. && pwd)

# sourcing necessary packages
. "$SCRIPT_DIR"/../scripts/menus.sh
. "$SCRIPT_DIR"/../scripts/functions.sh

SUDOERS="/etc/sudoers.bak"
FIND_USER_IN_SUDOERS="$(sudo grep "$USER ALL=(ALL:ALL) ALL" /etc/sudoers)"
GIT_EMAIL="joaov777@gmail.com"
GIT_USER="joaov777"

clear
        
	subMenu "Dotfiles" "Set up permissions for user $USER"
	
	echo "|--> Creating backup sudoers file at $SUDOERS" && sleep 1
	[ -f "$SUDOERS" ] || sudo cp /etc/sudoers /etc/sudoers.bak 

	echo "|--> Allowing root permissions for $USER (adding to sudoers file)" && sleep 1 &&
		[ $(id -u) != 0 ] && {
    		[ ! "$FIND_USER_IN_SUDOERS" ] && sudo bash -c "echo '$(whoami) ALL=(ALL:ALL) ALL' >> /etc/sudoers"
		} || {
    		[ ! "$FIND_USER_IN_SUDOERS" ] && echo "$(whoami) ALL=(ALL:ALL) ALL" >> /etc/sudoers
		}
	
	# if arch based
	[ -f "/etc/arch-release" ] && {
		echo "|--> Adding wheel group and updating sudoers for user $USER" && sleep 1
		sudo sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers
		sudo usermod -aG wheel $USER
	}

	echo "|--> Setting git credentials" && sleep 1
	cd $SCRIPT_DIR/.. && git config --local user.email "$GIT_EMAIL" &&
	cd $SCRIPT_DIR/.. && git config --local user.name "$GIT_USER" 

