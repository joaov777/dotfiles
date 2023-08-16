#!/bin/bash

# returning current directory of the repo locally 
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sourcing necessary packages
. "$SCRIPT_DIR"/scripts/menus.sh
. "$SCRIPT_DIR"/scripts/functions.sh

while [ true ]; do
        menu "Dotfiles (Working folder: $SCRIPT_DIR)"
        echo "0 - Set up permissions"
        echo "1 - Update System (Mirrors and packages)"
        echo "2 - Install Yay AUR Helper"
        echo "3 - Update Packages"
        echo "4 - Enable config files"
        echo "5 - Install ZSH and update .zshrc"
        echo "6 - Install System Fonts"
        line
        read -p "Option: " menuChoice
        
        case $menuChoice in
                q|Q|quit|QUIT|Quit|qUIT|exit|EXIT|Exit) exit 0 ;;
                0) $SCRIPT_DIR/scripts/permissions.sh ;;
                1) $SCRIPT_DIR/scripts/updatesystem.sh ;;
                2) $SCRIPT_DIR/scripts/install_yay_helper.sh ;;
                3) $SCRIPT_DIR/scripts/updatepackagesi3.sh ;;
                4) $SCRIPT_DIR/scripts/enableconfigfiles.sh ;;
                5) $SCRIPT_DIR/scripts/zsh.sh ;;  
                6) $SCRIPT_DIR/scripts/install_system_fonts.sh ;; 
                *) echo "Not defined!" && sleep 1 ;;
        esac
        done