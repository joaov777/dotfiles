#!/bin/bash

while [ true ];
        do

        clear
        echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF - i3 <|==============|"
        echo "#(1) - Update System (Mirrors and packages)"
        echo "#(2) - Update Packages"
        echo "#(3) - Enable config files"
        echo "#(4) - Install ZSH"
        echo "#(5) - Update .ZSHRC"
        echo "|-------------------------------------------|"
        read -p "Option: " menuChoice
        

        case $menuChoice in
                q|Q|quit|QUIT|Quit|qUIT|exit|EXIT|Exit) exit ;;
                1) ~/mainconf/mainconftree/updatesystem.sh ;;
                2) ~/mainconf/mainconftree/updatepackagesi3.sh ;;
                3) ~/mainconf/mainconftree/enableconfigfiles.sh ;;
                4) ~/mainconf/mainconftree/installzsh.sh ;;
                5) ~/mainconf/mainconftree/updatezshrc.sh ;;  
                *) echo "Not defined!" && sleep 1 ;;
        esac

        done ##i3 Menu Boundary