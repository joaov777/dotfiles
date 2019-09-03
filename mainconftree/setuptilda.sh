#!/bin/bash

clear
        
    echo "$(tput bold)$(tput setaf 7)"
    echo "|==============|> MAINCONF <|==============|"
    echo "|------------> SETUP TILDA <------------|"

    if [ ! -d ~/.config/tilda ]; then mkdir ~/.config/tilda ; fi

    echo "|---> Copying tilda files to ~/.config/tilda ..."
    cp -r ~/mainconf/varied/tildafiles/* ~/.config/tilda/

    echo "|---> Tilda files copied!!" ; sleep 1

    n=$(ls ~/mainconf/varied/tildafiles/ | wc -l)

    echo "|---> Generating symlinks..."
    for i in {0..$n-1}
    do
        file="config_$i"
        ln -sf ~/mainconf/varied/tildafiles/file ~/.config/tilda/
        
    done

    echo "|---> Symlinks generated..." ; sleep 2
