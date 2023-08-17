#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sourcing necessary packages
. "$SCRIPT_DIR"/../scripts/menus.sh
. "$SCRIPT_DIR"/../scripts/functions.sh

	subMenu "Dotfiles" "Update .zshrc" 
	checkFileExists "$HOME"/.zshrc && sudo rm "$HOME"/.zshrc 
	sudo cp "$SCRIPT_DIR"/../config/zsh/.zshrc "$HOME" && echo "|--> .zshrc restored" 
	changeOwnership $USER $USER "$HOME"/.zshrc
