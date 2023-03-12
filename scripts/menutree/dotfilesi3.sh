#!/bin/bash

. ~/dotfiles/scripts/misc/menus.sh

while [ true ];
        do

        menu "Dotfiles - i3"
        echo "0 - Set up permissions"
        echo "1 - Update System (Mirrors and packages)"
        echo "2 - Install Yay AUR Helper"
        echo "3 - Update Packages"
        echo "4 - Enable config files"
        echo "5 - Install ZSH and update .zshrc"
        echo "6 - Install System Fonts"
        line
        read -p "Option: " menuChoice
        

        case $menuChoice in
                q|Q|quit|QUIT|Quit|qUIT|exit|EXIT|Exit) exit 1 ;;
                0) ~/dotfiles/scripts/menutree/permissions.sh ;;
                1) ~/dotfiles/scripts/menutree/updatesystem.sh ;;
                2) ~/dotfiles/scripts/menutree/install_yay_helper.sh ;;
                3) ~/dotfiles/scripts/menutree/updatepackagesi3.sh ;;
                4) ~/dotfiles/scripts/menutree/enableconfigfiles.sh ;;
                5) ~/dotfiles/scripts/menutree/zsh.sh ;;  
                6) ~/dotfiles/scripts/menutree/install_system_fonts.sh ;; 
                *) echo "Not defined!" && sleep 1 ;;
        esac

        done ##i3 Menu Boundary