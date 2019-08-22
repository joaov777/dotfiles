#!/bin/bash



    clear
		echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF <|==============|"
        echo "|------------> ENABLE SHORTCUTS AND PANEL <-----------|"

    echo "|----> Copying shortcuts and xsettings..." ; sleep 1

    #variables
    shortcuts=~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
    xsettings=~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
    panel=~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml

    #deleting previous configs
    if [ -f $shortcuts ]; then echo "----> Deleting shortcuts.xml" ; rm $shortcuts > /dev/null ; fi
    if [ -f $xsettings ]; then echo "----> Deleting xsettings.xml" ; rm $xsettings > /dev/null ; fi

    #working on shortcuts
    wget -q -O $shortcuts https://raw.githubusercontent.com/joaov777/mainconf/master/varied/wiki/xfce4-keyboard-shortcuts.xml
    ln -sf ~/mainconf/varied/wiki/xfce4-keyboard-shortcuts.xml $shortcuts

    #working on xsettings
    wget -q -O $xsettings https://raw.githubusercontent.com/joaov777/mainconf/master/varied/wiki/xsettings.xml
    ln -sf ~/mainconf/varied/wiki/xsettings.xml $xsettings
    
    echo "|----> Updating shortcuts..." ; sleep 1
    kill -9 $(pidof xfconfd)
    kill -9 $(pidof xfsettingsd)
    xfsettingsd &
    /usr/lib/xfce4/xfconf/xfconfd &
    echo "|----> Shortcuts updated!!" ; sleep 2


    echo "|----> Copying xfce panel..." ; sleep 1
    if [ -f $panel ]; then echo "----> Deleting xfce4-panel.xml" ; rm $panel > /dev/null ; fi

    wget -q -O $panel https://raw.githubusercontent.com/joaov777/mainconf/master/varied/wiki/xfce4-panel.xml

    echo "|----> Updating panel..." ; sleep 2
    xfce4-panel -r > /dev/null

    echo "|----> Panel updated..." ; sleep 2

    
    

    