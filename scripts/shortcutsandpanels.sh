#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sourcing necessary packages
. "$SCRIPT_DIR"/../scripts/menus.sh
. "$SCRIPT_DIR"/../scripts/functions.sh
    
    # In case the config files below change, it is necessary to copy the file from 
    # "~/.config/xfce4/xfconf/xfce-perchannel-xml/" into "~/mainconf/varied/wiki/"

	subMenu "Dotfiles" "Update System" 

    echo "|--> Copying shortcuts and xsettings..." && sleep 1

    #variables
    shortcuts="$HOME"/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
    xsettings="$HOME"/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
    panel="$HOME"/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml

    #deleting previous configs if they exist
    if [ -f $shortcuts ]; then echo "|--> Deleting shortcuts.xml" ; rm $shortcuts > /dev/null ; fi
    if [ -f $xsettings ]; then echo "|--> Deleting xsettings.xml" ; rm $xsettings > /dev/null ; fi

    #downloading xfce4-keyboard-shortcuts.xml from github
    wget -q -O $shortcuts https://raw.githubusercontent.com/joaov777/mainconf/master/varied/xfcepanels/xfce4-keyboard-shortcuts.xml
    
    #downloading xsettings.xml from github
    wget -q -O $xsettings https://raw.githubusercontent.com/joaov777/mainconf/master/varied/xfcepanels/xsettings.xml
    
    echo "|--> Updating shortcuts..." && sleep 1
    kill -9 $(pidof xfconfd)
    xfsettingsd & >/dev/null
    pkill /usr/lib/xfce4/xconf/xconfd && nohup /usr/lib/xfce4/xfconf/xfconfd &

    echo "|--> Copying xfce panel..." && sleep 1
    if [ -f $panel ]; then echo "|----> Deleting xfce4-panel.xml" ; rm $panel 2>/dev/null ; fi
    wget -q -O $panel https://raw.githubusercontent.com/joaov777/mainconf/master/varied/xfcepanels/xfce4-panel.xml 
    
    echo "|--> Updating panel..." && sleep 1
    xfce4-panel -r > /dev/null


