#!/bin/bash
. ~/dotfiles/scripts/misc/menus.sh

while [ true ];
        do

        menu "Dotfiles - "
        echo "#(1) - i3"
        echo "#(2) - xfce"
        echo "|-------------------------------------------|"
        read -p "Option: " menuChoice
        

        case $menuChoice in
                q|Q|quit|QUIT|Quit|qUIT|exit|EXIT|Exit) exit ;;
                1) ~/dotfiles/scripts/menutree/dotfilesi3.sh ;;
                2) ~/dotfiles/scripts/menutree/dotfilesxfce.sh ;;
                *) echo "Not defined!" && sleep 1 ;;
        esac

        done ##Menu Boundary
