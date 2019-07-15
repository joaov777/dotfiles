#!/bin/bash

install_git() {
	echo ">> Installing git!!" ; sleep 2
	sudo pacman -S git --noconfirm
	echo ">> Git installed successfuly!!" ; sleep 2
}

user_setup() {
	echo '>> User setup...'
	read -p "Git username: " gitusername
	read -p "Git email:" gitemail

	sudo git config --global user.name "$gitusername"
	sudo git config --global user.email "$gitemail"
	sudo git config --global core.editor vim

	echo '>> User properly assigned!!' ; sleep 2
	clear
}

clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 1 - SETUP GIT USER -"
        sleep 1

	if [ -z "$(pacman -Qi git)" ];
	then
		echo ">> Git is not installed!!" ; sleep 2
		install_git
		user_setup
		
	else
		echo ">> Git is already installed!!" ; sleep 2
		user_setup
	fi

