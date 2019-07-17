#!/bin/bash

install_trizen() {
        cd ~ 
        git clone https://aur.archlinux.org/trizen.git
        cd trizen
        yes | makepkg -si

        cd ..
        rm -rf trizen

}


    if [ -z "$(pacman -Qi trizen)" ];
	then
		echo ">> Trizen is not installed!!" ; sleep 2
        echo ">> Installing Trizen AUR Helper" ; sleep 3
		install_trizen  

	else
		echo ">> Trizen is already installed!!" ; sleep 2
        
	fi

    source ~/.bashrc

    
    


    
    
