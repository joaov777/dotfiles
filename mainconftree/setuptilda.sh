#!/bin/bash

clear
        
    echo "$(tput bold)$(tput setaf 7)"
    echo "|==============|> MAINCONF <|==============|"
    echo "|------------> SETUP TILDA <------------|"

    #echo "|---> Copying tilda files to ~/.config/tilda ..."
    #cp -r ~/mainconf/varied/tildafiles/* ~/.config/tilda/

    #echo "|---> Tilda files copied!!" ; sleep 1

    n=$(ls ~/mainconf/varied/tildafiles/ | wc -l)

    echo "|---> Generating symlinks..."
    for i in {0..$n}
    do
        ln -sf ~/mainconf/varied/tildafiles/config_$i ~/.config/tilda/config_$i
        $i
    done

    echo "|---> Symlinks generated..." ; sleep 2
