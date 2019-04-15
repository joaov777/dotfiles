#!/bin/bash

clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 3 - UPDATE .ZSHRC -"
        sleep 1
	
	zshrcPATH="~/.zshrc"

	if [ -f $zshrcPATH ]
	then	
		echo ">>> File exists! Deleting!"
		sudo rm ~/.zshrc
	else
		echo ">>> File non-existent! Creating!"
		cat ~/mainconf/zsh/.zshrc > ~/.zshrc
            	sudo ln -sf ~/mainconf/zsh/.zshrc ~/.zshrc
	fi
        
	clear
