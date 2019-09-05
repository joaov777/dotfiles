#!/bin/bash

    #main config file
    #while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    while [ true ];
    do

    clear
    echo "$(tput bold)$(tput setaf 7)"
    echo "|==============|> MAINCONF <|==============|"
    echo "#(0) - Exit"
    echo "#(1) - Update System (Mirrors and packages)"
    echo "#(2) - Update Packages"
    echo "#(3) - Setup GIT User"
    echo "#(4) - Install ZSH"
    echo "#(5) - Update .ZSHRC"
    echo "#(6) - Enable shortcuts and panel"
    echo "#(7) - Set up Tilda terminal"
    echo "#(8) - Mainconf Express"
    echo "|-------------------------------------------|"
    read -p "Option: " menuChoice
    

    case $menuChoice in
            0) ~/mainconf/mainconftree/exitmainconf.sh ; exit ;;
            1) ~/mainconf/mainconftree/updatesystem.sh ;;
            2) ~/mainconf/mainconftree/updatepackages.sh ;;
            3) ~/mainconf/mainconftree/setupgituser.sh ;;
            4) ~/mainconf/mainconftree/installzsh.sh ;;
            5) ~/mainconf/mainconftree/updatezshrc.sh ;; 
            6) ~/mainconf/mainconftree/shortcuts.sh ;;
            7) ~/mainconf/mainconftree/setuptilda.sh ;;
            8) ~/mainconf/mainconftree/mainconfexpress.sh ;;
            *) ~/mainconf/mainconftree/invalidoption.sh ;;
    esac

    done
