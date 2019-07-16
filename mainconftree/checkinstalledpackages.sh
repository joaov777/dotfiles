#!/bin/bash

clear
        
        echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF <|==============|"
        echo "|-------> CHECK INSTALLED PACKAGES <-------|"
        sleep 1

	          read -p "> Package name: " packageName
	          echo "> Packages found: "
	          pacman -Qi $packageName

            sleep 5

        clear