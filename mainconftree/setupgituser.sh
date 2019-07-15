#!/bin/bash

install_git() {
	sudo pacman -S git --noconfirm
}

check_git() {
	pacman -Q | grep git
}

user_setup() {
	echo '>> User setup...'
	read -p "Git username: " gitusername
	read -p "Git email:" gitemail

    	sudo git config --global user.name "$gitusername"
        sudo git config --global user.email "$gitemail"
        sudo git config --global core.editor vim
}

clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 1 - SETUP GIT USER -"
        sleep 1

	res=$(pacman -Q | grep git)

	if [ -z "$res" ];
	then
		echo ">> Git is not installed!!"
		sleep 1
		echo ">> Installing git!!"
		install_git

		echo ">> Git installed successfuly!!"

		user_setup

		echo '>> User properly assigned!!'
		sleep 1

		clear
	else
		echo ">> Git is already installed!!"
		user_setup
	fi
















        clear
