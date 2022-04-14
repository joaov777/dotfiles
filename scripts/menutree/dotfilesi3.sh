#!/bin/bash

. ~/dotfiles/scripts/misc/menus.sh

while [ true ];
        do

        menu "Dotfiles - i3"
        echo "1 - Update System (Mirrors and packages)"
        echo "2 - Update Packages"
        echo "3 - Enable config files"
        echo "4 - Install ZSH"
        echo "5 - Update .ZSHRC"
        line
        read -p "Option: " menuChoice
        

        case $menuChoice in
                q|Q|quit|QUIT|Quit|qUIT|exit|EXIT|Exit) exit 1 ;;
                1) ~/dotfiles/scripts/menutree/updatesystem.sh ;;
                2) ~/dotfiles/scripts/menutree/updatepackagesi3.sh ;;
                3) ~/dotfiles/scripts/menutree/enableconfigfiles.sh ;;
                4) ~/dotfiles/scripts/menutree/installzsh.sh ;;
                5) ~/dotfiles/scripts/menutree/updatezshrc.sh ;;  
                *) echo "Not defined!" && sleep 1 ;;
        esac

        done ##i3 Menu Boundary