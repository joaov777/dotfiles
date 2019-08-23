#!/bin/bash

    #In case the config files below change, it is necessary to copy the file from "~/.config/xfce4/xfconf/xfce-perchannel-xml/" into "~/mainconf/varied/wiki/"

    clear
		echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF <|==============|"
        echo "|------------> ENABLE SHORTCUTS AND PANEL <-----------|"

    echo "|----> Copying shortcuts and xsettings..." ; sleep 1

    #variables
    shortcuts=~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
    xsettings=~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
    panel=~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml

    #deleting previous configs if they exist
    if [ -f $shortcuts ]; then echo "|----> Deleting shortcuts.xml" ; rm $shortcuts > /dev/null ; fi
    if [ -f $xsettings ]; then echo "|----> Deleting xsettings.xml" ; rm $xsettings > /dev/null ; fi

    #downloading xfce4-keyboard-shortcuts.xml from github
    wget -q -O $shortcuts https://raw.githubusercontent.com/joaov777/mainconf/master/varied/wiki/xfce4-keyboard-shortcuts.xml
    
    #downloading xsettings.xml from github
    wget -q -O $xsettings https://raw.githubusercontent.com/joaov777/mainconf/master/varied/wiki/xsettings.xml
    
    echo "|----> Updating shortcuts..." ; sleep 1
    kill -9 $(pidof xfconfd)
    kill -9 $(pidof xfsettingsd)
    xfsettingsd & >/dev/null
    /usr/lib/xfce4/xfconf/xfconfd &
    echo "|----> Shortcuts updated!!" ; sleep 2


    echo "|----> Copying xfce panel..." ; sleep 1
    if [ -f $panel ]; then echo "|----> Deleting xfce4-panel.xml" ; rm $panel > /dev/null ; fi

    wget -q -O $panel https://raw.githubusercontent.com/joaov777/mainconf/master/varied/wiki/xfce4-panel.xml

    echo "|----> Updating panel..." ; sleep 2
    xfce4-panel -r > /dev/null

    echo "|----> Panel updated..." ; sleep 2

    
    

    