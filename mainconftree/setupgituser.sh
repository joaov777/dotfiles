#!/bin/bash

clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 1 - SETUP GIT USER -"
        sleep 1

        echo '> Downloading git...'
	        sudo pacman -S trizen --noconfirm
	        trizen -S git --noconfirm
        
        echo '>User setup...'
        read -p "Git username: " gitusername
        read -p "Git email:" gitemail
        
            sudo git config --global user.name "$gitusername"
	        sudo git config --global user.email "$gitemail"
	        sudo git config --global core.editor vim

          cd ~/
	        git clone git@github.com:$gitusername/mainconf.git
            sudo chmod -R 777 ~/mainconf

        clear