#!/bin/bash

        clear
        
        echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF <|==============|"
        echo "|------------> UPDATE SYSTEM <-------------|"
        sleep 1

            sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu --noconfirm

        clear