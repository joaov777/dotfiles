#!/bin/bash

clear
        
    echo "$(tput bold)$(tput setaf 7)"
    echo "|==============|> MAINCONF <|==============|"
    echo "|------------> SETUP TILDA <------------|"

    #checking whether tilda is installed
    if [ -z "$(pacman -Qi tilda)" ];
	then
		echo "|---> Tilda is not installed!!" ; sleep 2
        echo "|---> Installing Tilda..." ; sleep 1
        
        #choosing best helper
        if pacman -Qi trizen > /dev/null 2>&1 ; then
			trizen -S tilda --noconfirm --needed &>/dev/null
		else
  			sudo pacman -S tilda --noconfirm --needed &>/dev/null
		fi


	else
		echo "|---> Tilda is already installed!!" ; sleep 2
	fi

    #making sure tilda config folder exists
    if [ ! -d ~/.config/tilda ]; then mkdir ~/.config/tilda ; fi

    echo "|---> Copying tilda files to ~/.config/tilda ..."
    cp -r ~/mainconf/varied/tildafiles/* ~/.config/tilda/config*

    echo "|---> Tilda files copied!!" ; sleep 1

    #number of files for loop
    n=$(ls ~/mainconf/varied/tildafiles/ | wc -l)

    echo "|---> Generating symlinks..."
    for i in {0..$n-1}
    do
        file="config_$i"
        ln -sf ~/mainconf/varied/tildafiles/file ~/.config/tilda/
        
    done

    echo "|---> Symlinks generated..." ; sleep 2
