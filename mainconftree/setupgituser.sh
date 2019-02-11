#!/bin/bash

clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 1 - SETUP GIT USER -"
        sleep 1

	        sudo pacman -S trizen --noconfirm
	        trizen -S git --noconfirm

          sudo git config --global user.name "joaov777"
	        sudo git config --global user.email "joaov777@gmail.com"
	        sudo git config --global core.editor vim

          cd ~/
	        git clone git@github.com:joaov777/mainconf.git
            sudo chmod -R 777 ~/mainconf

        clear