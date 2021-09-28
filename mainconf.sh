#!/bin/bash
. ~/mainconf/scripts/menus.sh

while [ true ];
        do

        menu "MAINCONF - "
        echo "#(1) - i3"
        echo "#(2) - xfce"
        echo "|-------------------------------------------|"
        read -p "Option: " menuChoice
        

        case $menuChoice in
                q|Q|quit|QUIT|Quit|qUIT|exit|EXIT|Exit) exit ;;
                1) ~/mainconf/mainconfi3.sh ;;
                2) ~/mainconf/mainconfxfce.sh ;;
                *) echo "Not defined!" && sleep 1 ;;
        esac

        done ##Menu Boundary