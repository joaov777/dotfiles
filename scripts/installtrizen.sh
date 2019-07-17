#!/bin/bash

install_trizen() {
        cd ~ 
        git clone https://aur.archlinux.org/trizen-git.git
        cd trizen-git
        yes | makepkg -si

        cd ..
        rm -rf trizen-git

}


    if [ -z "$(pacman -Qi trizen)" ];
	then
		echo ">> Trizen is not installed!!" ; sleep 2
        echo ">> Installing Trizen AUR Helper" ; sleep 3
		install_trizen    
	else
		echo ">> Trizen is already installed!!" ; sleep 2
        source ~/.bashrc
	fi

    
    


    
    
