#!/bin/bash

# returning current directory of the repo locally 
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sourcing necessary packages
. "$SCRIPT_DIR"/scripts/menus.sh
. "$SCRIPT_DIR"/scripts/functions.sh

function press_enter_to_continue() {
	read -p "Press enter to continue..."
}

menu_options=(
	"Set up permissions"
	"Update System (Mirrors and packages)"
	"Install Yay AUR Helper"
	"Update packages"
	"Enable config files"
	"Manage ZSH"
	"Install system fonts"
	)

menu_functions=(
	"$SCRIPT_DIR/scripts/permissions.sh"
	"$SCRIPT_DIR/scripts/updatesystem.sh"
	"$SCRIPT_DIR/scripts/install_yay_helper.sh"
	"$SCRIPT_DIR/scripts/updatepackagesi3.sh"
	"$SCRIPT_DIR/scripts/enableconfigfiles.sh"
	"$SCRIPT_DIR/scripts/zsh.sh"
	"$SCRIPT_DIR/scripts/install_system_fonts.sh"
)

while true; do

	clear
	menu "Dotfiles (Working folder: $SCRIPT_DIR)"
	for ((i=0; i<${#menu_options[@]}; i++)); do
		echo "($((i+1))) - ${menu_options[i]}"
	done
		line
		read -p "Option: " user_option

		[[ "$user_option" =~ ^[qQ]$|^quit$|^QUIT$ ]] && exit 0 

		[[ "$user_option" =~ ^[1-${#menu_options[@]}]$ ]] && {
			user_option=$((user_option - 1))
			${menu_functions[$user_option]} 
			press_enter_to_continue
		} || {
			echo "Invalid input" && press_enter_to_continue
		}
	clear
done
