#!/bin/bash

clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 7 - CHECK INSTALLED PACKAGES -"

	          read -p "> Package name: " packageName
	          echo "> Packages found: "
	          pacman -Q | grep $packageName

            sleep 5

        clear