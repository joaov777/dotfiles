#!/bin/bash

. ~/dotfiles/scripts/misc/menus.sh

while [ true ];
        do

        menu "Dotfiles - Xfce4"
        echo "1 - Update System (Mirrors and packages)"
        echo "2 - Update Packages"
        echo "3 - Install ZSH"
        echo "4 - Update .ZSHRC"
        echo "5 - Enable shortcuts and panel"
        echo "6 - Install System Fonts"
        line
        read -p "Option: " menuChoice
        

        case $menuChoice in
                q|Q|quit|QUIT|Quit|qUIT|exit|EXIT|Exit) exit ;;
                1) ~/dotfiles/scripts/menutree/updatesystem.sh ;;
                2) ~/dotfiles/scripts/menutree/updatepackagesxfce.sh ;;
                3) ~/dotfiles/scripts/menutree/installzsh.sh ;;
                4) ~/dotfiles/scripts/menutree/updatezshrc.sh ;; 
                5) ~/dotfiles/scripts/menutree/shortcutsandpanels.sh ;;
                6) ~/dotfiles/scripts/menutree/install_system_fonts.sh ;; 
                *) echo "Not defined!" && sleep 1 ;;
        esac

        done ##Xfce Menu Boundary