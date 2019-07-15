#!/bin/bash

clear
        echo '########## MAIN CONF ##########'
        echo "- ## CHECK INSTALLED PACKAGES ## -"

	          read -p "> Package name: " packageName
	          echo "> Packages found: "
	          pacman -Qi $packageName

            sleep 5

        clear