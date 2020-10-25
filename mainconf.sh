#!/bin/bash

    #!/bin/bash

    if [ $XDG_CURRENT_DESKTOP == "XFCE" ] 
    then

        while [ true ];
        do

        clear
        echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF - XFCE <|==============|"
        echo "#(0) - Exit"
        echo "#(1) - Update System (Mirrors and packages)"
        echo "#(2) - Install XFCE DE"
        echo "#(3) - Update Packages"
        echo "#(4) - Setup GIT User"
        echo "#(5) - Install ZSH"
        echo "#(6) - Update .ZSHRC"
        echo "#(7) - Enable shortcuts and panel"
        echo "#(8) - Set up Tilda terminal"
        echo "#(9) - Download Wiki"
        echo "|-------------------------------------------|"
        read -p "Option: " menuChoice
        

        case $menuChoice in
                0) ~/mainconf/mainconftree/exitmainconf.sh ; exit ;;
                1) ~/mainconf/mainconftree/updatesystem.sh ;;
                2) ~/mainconf/mainconftree/installXFCEde.sh ;;
                3) ~/mainconf/mainconftree/updatepackagesxfce.sh ;;
                4) ~/mainconf/mainconftree/setupgituser.sh ;;
                5) ~/mainconf/mainconftree/installzsh.sh ;;
                6) ~/mainconf/mainconftree/updatezshrc.sh ;; 
                7) ~/mainconf/mainconftree/shortcutsandpanels.sh ;;
                8) ~/mainconf/mainconftree/setuptilda.sh ;;
                9) ~/mainconf/mainconftree/downloadwiki.sh ;;
                *) ~/mainconf/mainconftree/invalidoption.sh ;;
        esac

        done ##Xfce Menu Boundary

    elif [ $XDG_CURRENT_DESKTOP == "i3" ]
        then
            while [ true ];
        do

        clear
        echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF - i3 <|==============|"
        echo "#(0) - Exit"
        echo "#(1) - Update System (Mirrors and packages)"
        echo "#(2) - Update Packages"
        echo "#(3) - Enable config files"
        echo "#(4) - Install ZSH"
        echo "#(5) - Update .ZSHRC"
        echo "#(6) - Setup GIT User"
        echo "#(7) - Download Wiki"
        echo "|-------------------------------------------|"
        read -p "Option: " menuChoice
        

        case $menuChoice in
                0) ~/mainconf/mainconftree/exitmainconf.sh ; exit ;;
                1) ~/mainconf/mainconftree/updatesystem.sh ;;
                2) ~/mainconf/mainconftree/updatepackagesi3.sh ;;
                3) ~/mainconf/mainconftree/enableconfigfiles.sh ;;
                4) ~/mainconf/mainconftree/installzsh.sh ;;
                5) ~/mainconf/mainconftree/updatezshrc.sh ;;  
                6) ~/mainconf/mainconftree/setupgituser.sh ;;
                7) ~/mainconf/mainconftree/downloadwiki.sh ;;
                *) ~/mainconf/mainconftree/invalidoption.sh ;;
        esac

        done ##i3 Menu Boundary

    else
        echo "DE not configured!"
    fi