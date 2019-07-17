#!/bin/bash

install_git() {
	echo ">> Installing git!!" ; sleep 1
	sudo pacman -S git --noconfirm
	echo ">> Git installed successfuly!!" ; sleep 1
}

user_setup() {
	echo '>> User setup...'
	read -p "Git username: " gitusername
	read -p "Git email:" gitemail

	git config --global user.name "$gitusername"
	git config --global user.email "$gitemail"
	git config --global core.editor vim

	echo '>> User properly assigned!!' ; sleep 1
	clear
}

clear
        
		echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF <|==============|"
        echo "|------------> SETUP GIT USER <------------|"
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

