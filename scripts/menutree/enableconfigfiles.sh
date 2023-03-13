#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sourcing necessary packages
. "$SCRIPT_DIR"/../misc/menus.sh
. "$SCRIPT_DIR"/../misc/functions.sh
        
        subMenu "Dotfiles" "Enable Config files"

        createFolderAndAssignOwnership ~/.config/Dharkael $USER $USER && {
                [ $(cp ~/dotfiles/config/i3related/flameshot/flameshot.ini ~/.config/Dharkael/ 2>/dev/null) ] && 
                echo "|--> Flameshot enabled" || echo "|--> Flameshot not enabled"
        }

        createFolderAndAssignOwnership ~/.config/vifm $USER $USER && {
                [ $(cp -r ~/dotfiles/config/vifm/themes ~/.config/vifm/colors/ &&
                cp ~/dotfiles/config/vifm/vifmrc ~/.config/vifm/ 2>/dev/null) ] && 
                echo "|--> Vifm enabled" || echo "|--> Vifm not enabled"
        }

        createFolderAndAssignOwnership ~/.config/autorandr $USER $USER && {
                [ $(cp -r ~/dotfiles/config/monitors/autorandr/* ~/.config/autorandr 2>/dev/null) ] && 
                echo "|--> Autorandr profiles loaded" || echo "|--> Autorandr profiles not loaded"
        }

        createFolderAndAssignOwnership ~/.config/polybar $USER $USER && {
                [ $(cp ~/dotfiles/config/i3related/polybar/config ~/.config/polybar/ &&
                cp ~/dotfiles/config/i3related/polybar/launch_polybar.sh ~/.config/polybar/ 2>/dev/null) ] &&
                echo '|--> Polybar enabled' || echo "|--> Polybar not enabled"
        }

        [ $(dconf load /com/gexperts/Tilix/ < ~/dotfiles/config/tilix/grape.dconf 2>/dev/null) ] &&
                echo "|--> Tilix enabled" || echo "|--> Tilix not enabled"

        createFolderAndAssignOwnership ~/.config/rofi $USER $USER && {
                [ $(cp ~/dotfiles/config/i3related/rofi/config ~/.config/rofi/ 2>/dev/null) ] && 
                echo "|--> Rofi launcher enabled" || echo "|--> Rofi launcher not enabled"
        }

        createFolderAndAssignOwnership ~/.config/zathura $USER $USER && {
                [ $(cp ~/dotfiles/config/i3related/zathura/zathurarc ~/.config/zathura/ 2>/dev/null) ] && 
                echo "|--> Zathura enabled" || echo "|--> Zathura not enabled"
        }

        createFolderAndAssignOwnership /etc/X11/xorg.conf.d $USER $USER && {
                [ $(cp ~/dotfiles/config/i3related/EnableTapToClick_touchpad/90-touchpad.conf /etc/X11/xorg.conf.d/ 2>/dev/null) ] &&
                echo "|--> Tap to click enabled" || echo "|--> Tap to click not enabled"
        }

        createFolderAndAssignOwnership /etc/bluetooth $USER $USER && {
                [ $(cp ~/dotfiles/config/i3related/bluetooth/main.conf /etc/bluetooth/ 2>/dev/null) ] && 
                echo "|--> Bluetooth enabled" || echo "|--> Bluetooth not enabled"
        }

        [ $(cp ~/dotfiles/config/tmux/.tmux.conf /home/$USER 2>/dev/null) ] &&
                echo "|--> Tmux conf file enabled" || echo "Tmux conf file not enabled"

        [ $(cp -r ~/dotfiles/config/themes/* /usr/share/themes/ 2>/dev/null) ] &&
                echo "|--> Themes enabled" || echo "|--> Themes not enabled"

        [ $(cp -r ~/dotfiles/config/cursors/* /usr/share/icons/ 2>/dev/null) ] &&
                echo "|--> Cursor themes enabled" || echo "|--> Cursor themes not enabled"

        [ $(cp ~/dotfiles/config/notepadqq/Notepadqq.ini ~/.config/Notepadqq 2>/dev/null) ] &&
                echo "|--> Notepadqq config file enabled" || echo "|--> Notepadqq config file not enabled"

        createFolderAndAssignOwnership ~/.config/i3 $USER $USER && {
                [ $(cp ~/dotfiles/config/i3related/i3config/config ~/.config/i3/ 2>/dev/null) ] && 
                echo "|--> i3 config enabled"  || echo "i3 config not enabled"
        }
