#!/bin/bash

clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 3 - UPDATE .ZSHRC -"
        sleep 1
	
	zshrcPATH="/home/joao/.zshrc"

	if [ -f $zshrcPATH ]
	then	
		echo ">>> File exists! Deleting!"
		sleep 1
		sudo rm /home/joao/.zshrc
		
		echo ">>> File non-existent! Creating and updating!"
		sleep 1
		cat ~/mainconf/zsh/.zshrc > ~/.zshrc
            	sudo ln -sf ~/mainconf/zsh/.zshrc ~/.zshrc

	else
		echo ">>> File non-existent! Creating!"
		sleep 1
		cat ~/mainconf/zsh/.zshrc > ~/.zshrc
            	sudo ln -sf ~/mainconf/zsh/.zshrc ~/.zshrc
	fi
        
	clear
