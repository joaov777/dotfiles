#!/bin/bash

clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 1 - SETUP GIT USER -"
        sleep 1
        
        echo '>User setup...'
        read -p "Git username: " gitusername
        read -p "Git email:" gitemail
        
            	sudo git config --global user.name "$gitusername"
	        sudo git config --global user.email "$gitemail"
	        sudo git config --global core.editor vim

        clear
