#!/bin/bash

        clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 4 - UPDATE SYSTEM (MIRRORS AND PACKAGES) -"
        sleep 1

            sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu --noconfirm
            sudo pacman-optimize && sync --noconfirm
            sudo pacman -Syyu --noconfirm

        clear