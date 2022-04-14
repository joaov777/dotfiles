#!/bin/bash
. ~/dotfiles/scripts/misc/menus.sh
. ~/dotfiles/scripts/misc/functions.sh

	#menu
	subMenu "Dotfiles" "Update .zshrc" 
	checkFileExists ~/.zshrc && sudo rm ~/.zshrc 
	sudo cp ~/dotfiles/config/zsh/.zshrc /home/$USER && echo "|--> .zshrc restored" 
	changeOwnership $USER $USER ~/.zshrc
	sleep 1

