#!/bin/bash

clear
        
        echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF <|==============|"
        echo "|----------> EXPRESS INSTALLATION <--------|"
        sleep 1
        

    
    #~/mainconf/mainconftree/updatesystem.sh 
    #clear

    #requirement for all packages download -
    ~/mainconf/scripts/installtrizen.sh

    ~/mainconf/mainconftree/updatepackages.sh 
    clear
    ~/mainconf/mainconftree/setupgituser.sh 
    clear
    ~/mainconf/mainconftree/installzsh.sh 
    clear
    ~/mainconf/mainconftree/updatezshrc.sh 
    clear