#!/bin/bash

clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 8 - SETUP PLANK -"

             echo "> Installing themes..."
             sudo cp -R ~/mainconf/plank/themes/* ~/.local/share/plank/themes/.

             sleep 2

             echo "> Enabling launchers..."
             sudo cp ~/mainconf/plank/launchers/* ~/.config/plank/dock1/launchers/.

             echo "> SUCCESS!! - Plank Themes and launchers correctly enabled!!"
	          

            sleep 3

        clear