#!/bin/bash

    clear
		echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF <|==============|"
        echo "|------------> ENABLE SHORTCUTS <-----------|"

    echo "|----> Copying shortcuts..."
    curl https://raw.githubusercontent.com/joaov777/mainconf/master/varied/wiki/xfce4-keyboard-shortcuts.xml > ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
    
    echo "|----> Updating shortcuts..."
    kill -9 $(pidof xfconfd)
    kill -9 $(pidof xfsettingsd)
    xfsettingsd &
    /usr/lib/xfce4/xfconf/xfconfd & 
    #> /dev/null 2>&1
    
    echo "|----> Shortcuts updated!!" ; sleep 2

    