#!/bin/bash
. ~/mainconf/scripts/menus.sh
. ~/mainconf/scripts/functions.sh

	#menu
	subMenu "MAINCONF - i3" "Update .zshrc" 
	checkFileExists ~/.zshrc && sudo rm ~/.zshrc 
	sudo cp ~/mainconf/zsh/.zshrc /home/$USER && echo "|--> .zshrc restored" 
	changeOwnership $USER $USER ~/.zshrc
	sleep 1

