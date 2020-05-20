#!/bin/bash

        clear
        
        echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF <|==============|"
        echo "|------------> UPDATE SYSTEM <-------------|"
        sleep 1

            sudo pacman -Syyuu --noconfirm

        clear