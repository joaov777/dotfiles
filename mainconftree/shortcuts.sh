#!/bin/bash

check_file() {
    if [ -f "$1" ]; 
    then    
        echo "----> Working on files..." ; sleep 1
        rm "$1"
    fi

    }

    clear
		echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF <|==============|"
        echo "|------------> ENABLE SHORTCUTS AND PANEL <-----------|"

    echo "|----> Copying shortcuts..." ; sleep 1
    check_file ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
    check_file ~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml

    #working on shortcuts
    wget -q -O ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml https://raw.githubusercontent.com/joaov777/mainconf/master/varied/wiki/xfce4-keyboard-shortcuts.xml
    ln -sf ~/mainconf/varied/wiki/xfce4-keyboard-shortcuts.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml

    #working on xsettings
    wget -q -O ~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml https://raw.githubusercontent.com/joaov777/mainconf/master/varied/wiki/xsettings.xml
    ln -sf ~/mainconf/varied/wiki/xsettings.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
    
    echo "|----> Updating shortcuts..." ; sleep 1
    kill -9 $(pidof xfconfd)
    kill -9 $(pidof xfsettingsd)
    xfsettingsd &
    /usr/lib/xfce4/xfconf/xfconfd &
    echo "|----> Shortcuts updated!!" ; sleep 2


    echo "|----> Copying xfce panel..." ; sleep 1
    rm ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml > /dev/null
    wget -q -O ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml https://raw.githubusercontent.com/joaov777/mainconf/master/varied/wiki/xfce4-panel.xml

    echo "|----> Updating panel..." ; sleep 2
    xfce4-panel -r > /dev/null

    echo "|----> Panel updated..." ; sleep 2

    
    

    