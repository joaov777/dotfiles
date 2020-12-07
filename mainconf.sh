#!/bin/bash

    #!/bin/bash


    if [ $XDG_CURRENT_DESKTOP == "XFCE" ] 
    then

        while [ true ];
        do

        clear
        echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF - XFCE <|==============|"
        echo "#(1) - Update System (Mirrors and packages)"
        echo "#(2) - Install XFCE DE"
        echo "#(3) - Update Packages"
        echo "#(4) - Install ZSH"
        echo "#(5) - Update .ZSHRC"
        echo "#(6) - Enable shortcuts and panel"
        echo "#(7) - Set up Tilda terminal"
        echo "#(8) - Download Wiki"
        echo "|-------------------------------------------|"
        read -p "Option: " menuChoice
        

        case $menuChoice in
                q|Q|quit|QUIT|Quit|qUIT|exit|EXIT|Exit) exit ;;
                1) ~/mainconf/mainconftree/updatesystem.sh ;;
                2) ~/mainconf/mainconftree/installXFCEde.sh ;;
                3) ~/mainconf/mainconftree/updatepackagesxfce.sh ;;
                4) ~/mainconf/mainconftree/installzsh.sh ;;
                5) ~/mainconf/mainconftree/updatezshrc.sh ;; 
                6) ~/mainconf/mainconftree/shortcutsandpanels.sh ;;
                7) ~/mainconf/mainconftree/setuptilda.sh ;;
                8) ~/mainconf/mainconftree/downloadwiki.sh ;;
                *) echo "Not defined!" && sleep 1 ;;
        esac

        done ##Xfce Menu Boundary

    elif [ $XDG_CURRENT_DESKTOP == "i3" ]
        then
            while [ true ];
        do

        clear
        echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF - i3 <|==============|"
        echo "#(1) - Update System (Mirrors and packages)"
        echo "#(2) - Update Packages"
        echo "#(3) - Enable config files"
        echo "#(4) - Install ZSH"
        echo "#(5) - Update .ZSHRC"
        echo "#(6) - Download Wiki"
        echo "|-------------------------------------------|"
        read -p "Option: " menuChoice
        

        case $menuChoice in
                q|Q|quit|QUIT|Quit|qUIT|exit|EXIT|Exit) exit ;;
                1) ~/mainconf/mainconftree/updatesystem.sh ;;
                2) ~/mainconf/mainconftree/updatepackagesi3.sh ;;
                3) ~/mainconf/mainconftree/enableconfigfiles.sh ;;
                4) ~/mainconf/mainconftree/installzsh.sh ;;
                5) ~/mainconf/mainconftree/updatezshrc.sh ;;  
                6) ~/mainconf/mainconftree/downloadwiki.sh ;;
                *) echo "Not defined!" && sleep 1 ;;
        esac

        done ##i3 Menu Boundary

    else
        echo "DE not configured!"
    fi