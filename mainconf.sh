#!/bin/bash

    if [ $XDG_CURRENT_DESKTOP == "XFCE" ];
    then

        ~/mainconf/mainconfxfce.sh

    elif [ $XDG_CURRENT_DESKTOP == "i3" ];
        then
        
        ~/mainconf/mainconfi3.sh

    else
        echo "DE not configured!"
    fi
