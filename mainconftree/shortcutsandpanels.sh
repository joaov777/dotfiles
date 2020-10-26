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

    rm ~/.config/xfce4/xfconf/xfce-perchannel-xml/*
    cp ~/mainconf/varied/wiki/xfcepanels/panels04/* ~/.config/xfce4/xfconf/xfce-perchannel-xml/

    #deleting previous configs if they exist
    #if [ -f $shortcuts ]; then echo "|----> Deleting shortcuts.xml" ; rm $shortcuts > /dev/null ; fi
    #if [ -f $xsettings ]; then echo "|----> Deleting xsettings.xml" ; rm $xsettings > /dev/null ; fi

    #downloading xfce4-keyboard-shortcuts.xml from github
    #wget -q -O $shortcuts https://raw.githubusercontent.com/joaov777/mainconf/master/varied/wiki/xfce4-keyboard-shortcuts.xml
    #cp ~/mainconf/varied/wiki/xfcepanels/panels04/xfce4-keyboard-shortcuts.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/
    
    #downloading xsettings.xml from github
    #wget -q -O $xsettings https://raw.githubusercontent.com/joaov777/mainconf/master/varied/wiki/xsettings.xml
    #cp ~/mainconf/varied/wiki/xfcepanels/panels04/xsettings.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/
    
    echo "|----> Updating shortcuts..." ; sleep 1
    #kill -9 $(pidof xfconfd)
    #kill -9 $(pidof xfsettingsd)
    xfsettingsd & >/dev/null
    pkill /usr/lib/xfce4/xconf/xconfd && nohup /usr/lib/xfce4/xfconf/xfconfd &
    echo "|----> Shortcuts updated!!" ; sleep 1

    echo "|----> Copying xfce panel..." ; sleep 1
    #if [ -f $panel ]; then echo "|----> Deleting xfce4-panel.xml" ; rm $panel 2>/dev/null ; fi

    #wget -q -O $panel https://raw.githubusercontent.com/joaov777/mainconf/master/varied/wiki/xfce4-panel.xml 
    #cp ~/mainconf/varied/wiki/xfcepanels/panels02/xfce4-panel.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/

    #echo "|----> Updating panel..." ; sleep 1
    xfce4-panel -r > /dev/null

    #echo "|----> Panel updated..." ; sleep 1

    #plank dock related

    echo "|----> Configuring the dock..." ; sleep 1
    echo "|----> Applying standard settings..." ; sleep 1
    pkill plank && dconf load /net/launchpad/plank/docks/ < ~/mainconf/varied/plank/plank_settings.ini
    
    if [ -d ~/.config/plank/dock1/ ]; then echo "|----> Deleting dock folder content" ; rm -rf ~/.config/plank/dock1 ; fi
    if [ ! -d ~/.config/plank/dock1/ ]; then echo "|----> Creating dock folder content" ; mkdir -p ~/.config/plank/dock1/launchers/ ; fi
    cp ~/mainconf/varied/plank/launchers/* ~/.config/plank/dock1/launchers/

    if [ ! -d ~/shortcuts ]; then echo "|----> Creating plank shortcuts folder" ; mkdir ~/shortcuts ; fi
    cp -r ~/mainconf/varied/plank/shortcuts/* ~/shortcuts/

    echo "|----> Copying plank themes..." ; sleep 1
    cp -r ~/mainconf/varied/plank/themes/* ~/.local/share/plank/themes/

    echo "|----> Dock updated..." ; sleep 1

    #running the dock in bg and deatching it
    nohup plank -n dock1 & 
    rm $PWD/nohup.out && rm ~/mainconf/nohup.out