#!/bin/bash

clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 6 - UPDATE TILDA -"
        sleep 1

            #creating or overwriting tilda config files for three terminals
            cat ~/mainconf/tilda/config_0 > ~/.config/tilda/config_0
            cat ~/mainconf/tilda/config_1 > ~/.config/tilda/config_1
            cat ~/mainconf/tilda/config_2 > ~/.config/tilda/config_2

            #creating links to the main file in configXfce3
            sudo ln -sf ~/mainconf/tilda/config_0 ~/.config/tilda/config_0
            sudo ln -sf ~/mainconf/tilda/config_1 ~/.config/tilda/config_1
            sudo ln -sf ~/mainconf/tilda/config_2 ~/.config/tilda/config_2

        clear