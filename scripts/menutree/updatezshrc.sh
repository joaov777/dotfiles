#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sourcing necessary packages
. "$SCRIPT_DIR"/../misc/menus.sh
. "$SCRIPT_DIR"/../misc/functions.sh

	subMenu "Dotfiles" "Update .zshrc" 
	checkFileExists ~/.zshrc && sudo rm ~/.zshrc 
	sudo cp ~/dotfiles/config/zsh/.zshrc /home/$USER && echo "|--> .zshrc restored" 
	changeOwnership $USER $USER ~/.zshrc
