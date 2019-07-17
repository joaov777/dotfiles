#!/bin/bash

install_trizen() {
        cd ~ 
        git clone https://aur.archlinux.org/trizen.git
        cd trizen
        yes | makepkg -si

        cd ..
        rm -rf trizen

}

    echo "$(tput bold)$(tput setaf 7)"
	echo "|==============|> MAINCONF <|==============|"
	echo "|------------> UPDATE PACKAGES <-----------|"

    #check whether trizen is installed
    if [ -z "$(pacman -Qi trizen)" ];
	then
		echo ">> Trizen is not installed!!" ; sleep 2
        echo ">> Installing Trizen AUR Helper" ; sleep 3
		install_trizen  

	else
		echo ">> Trizen is already installed!!" ; sleep 2
	fi

exit

    
    


    
    
