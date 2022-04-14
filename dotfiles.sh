#!/bin/bash
. ~/dotfiles/scripts/misc/menus.sh

while [ true ];
        do

        
        if [ $# -eq 0 ]; then
                echo "Insert i3 or xfce as a parameter" && exit
        elif [ "$1" == "i3" ]; then 
                exec ~/dotfiles/scripts/menutree/dotfilesi3.sh
        elif [ "$1" == "xfce" ]; then 
                exec ~/dotfiles/scripts/menutree/dotfilesxfce.sh
        elif [ "$1" == "q" ]; then 
                exit
        else
                echo "Not defined!" && sleep 1
        fi

        done ##Menu Boundary
