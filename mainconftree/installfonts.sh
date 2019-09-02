#!/bin/bash

clear
        
    echo "$(tput bold)$(tput setaf 7)"
    echo "|==============|> MAINCONF <|==============|"
    echo "|------------> INSTALL FONTS <------------|"

    echo "|---> Checking fonts folder..."
    if [ ! -d /usr/share/fonts ]; then
        sudo mkdir /usr/share/fonts
        echo "|---> /usr/share/folder created"
    fi
        
        echo "|---> Cloning mainconffonts repo"
        cd /usr/share/fonts
        git clone --quiet https://github.com/joaov777/mainconffonts.git

        echo "|---> Copying fonts"
        cp -r mainconffonts/* /usr/share/fonts/
        rm -rf /usr/share/fonts/mainconffonts

		echo "|---> Fonts installed!!" ; sleep 2