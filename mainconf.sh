#!/bin/bash


    while [ true ];
    do

    clear
    echo "$(tput setaf 6)###### MAIN CONF #######"
    echo "#(1) - Setup GIT User"
    echo "#(2) - Install ZSH"
    echo "#(3) - Update .ZSHRC"
    echo "#(4) - Update System (Mirrors and packages)"
    echo "#(5) - Update Packages"
    echo "#(6) - Update Tilda"
    echo "#(7) - Check Installed Packages"
    echo "#(8) - Setup Plank"
    echo "#(9) - Exit"
    echo "############################"
    read -p "Option: " menuChoice


    case $menuChoice in
            1) ~/mainconf/mainconftree/setupgituser.sh ;;
            2) ~/mainconf/mainconftree/installzsh.sh ;;
            3) ~/mainconf/mainconftree/updatezshrc.sh ;;
            4) ~/mainconf/mainconftree/updatesystem.sh ;;
            5) ~/mainconf/mainconftree/updatepackages.sh ;;
            6) ~/mainconf/mainconftree/updatetilda.sh ;;
            7) ~/mainconf/mainconftree/checkinstalledpackages.sh ;;
	        8) ~/mainconf/mainconftree/setupplank.sh ;;
            9) ~/mainconf/mainconftree/exitmainconf.sh ; exit ;;
            *) ~/mainconf/mainconftree/invalidoption.sh ;;
    esac

    done
