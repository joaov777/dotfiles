#!/bin/bash

    clear
		echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF <|==============|"
        echo "|------------> ENABLE SHORTCUTS AND PANEL <-----------|"

    echo "|----> Copying shortcuts..." ; sleep 1
    #curl https://raw.githubusercontent.com/joaov777/mainconf/master/varied/wiki/xfce4-keyboard-shortcuts.xml > ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
    wget -q -O ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml https://raw.githubusercontent.com/joaov777/mainconf/master/varied/wiki/xfce4-keyboard-shortcuts.xml
    
    echo "|----> Updating shortcuts..." ; sleep 1
    kill -9 $(pidof xfconfd)
    kill -9 $(pidof xfsettingsd)
    xfsettingsd &
    /usr/lib/xfce4/xfconf/xfconfd &
    echo "|----> Shortcuts updated!!" ; sleep 2


    echo "|----> Copying xfce panel..." ; sleep 1
    #curl https://raw.githubusercontent.com/joaov777/mainconf/master/varied/wiki/xfce4-panel.xml > ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
    wget -q -O ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml https://raw.githubusercontent.com/joaov777/mainconf/master/varied/wiki/xfce4-panel.xml

    echo "|----> Updating panel..." ; sleep 2
    xfce4-panel -r > /dev/null

    echo "|----> Panel updated..." ; sleep 2
    
    

    