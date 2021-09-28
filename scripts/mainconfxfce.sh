#!/bin/bash

while [ true ];
        do

        clear
        echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF - XFCE <|==============|"
        echo "#(1) - Update System (Mirrors and packages)"
        echo "#(2) - Update Packages"
        echo "#(3) - Install ZSH"
        echo "#(4) - Update .ZSHRC"
        echo "#(5) - Enable shortcuts and panel"
        echo "|-------------------------------------------|"
        read -p "Option: " menuChoice
        

        case $menuChoice in
                q|Q|quit|QUIT|Quit|qUIT|exit|EXIT|Exit) exit ;;
                1) ~/mainconf/mainconftree/updatesystem.sh ;;
                2) ~/mainconf/mainconftree/updatepackagesxfce.sh ;;
                3) ~/mainconf/mainconftree/installzsh.sh ;;
                4) ~/mainconf/mainconftree/updatezshrc.sh ;; 
                5) ~/mainconf/mainconftree/shortcutsandpanels.sh ;;
                *) echo "Not defined!" && sleep 1 ;;
        esac

        done ##Xfce Menu Boundary