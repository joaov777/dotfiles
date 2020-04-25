#!/bin/bash

clear
        
        echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF <|==============|"
        echo "|----------> EXPRESS INSTALLATION <--------|"
        sleep 1
       

    ~/mainconf/mainconftree/updatesystem.sh 
    clear
    ~/mainconf/mainconftree/updatepackages.sh 
    clear
    ~/mainconf/mainconftree/setupgituser.sh 
    clear
    ~/mainconf/mainconftree/installzsh.sh 
    clear
    ~/mainconf/mainconftree/updatezshrc.sh 
    clear
	
	