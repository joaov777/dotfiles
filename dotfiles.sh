#!/bin/bash

while [ true ];
        do

        
        if [ $# -eq 0 ]; then
                echo -e "Usage:\n$0 i3\n$0 xfce" && exit
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
