#!/bin/bash

clear
        
    echo "$(tput bold)$(tput setaf 7)"
    echo "|==============|> MAINCONF <|==============|"
    echo "|------------> INSTALL FONTS <------------|"

    echo "|---> Checking fonts folder..."
    if [ ! -d /usr/share/fonts ]; then
        echo "|---> /usr/share/folder NON-EXISTENT!"
        
        sudo mkdir /usr/share/fonts
        echo "|---> /usr/share/folder created"
    fi
        
        cd ~
        echo "|---> Cloning mainconffonts repo"
        git clone --quiet https://github.com/joaov777/mainconffonts.git
        
       

        echo "|---> Copying fonts"
        cp -r mainconffonts/ /usr/share/fonts/
        rm -rf ~/mainconffonts

		echo "|---> Fonts installed!!" ; sleep 2