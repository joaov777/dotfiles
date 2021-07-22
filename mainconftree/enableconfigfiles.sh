#!/bin/bash

. ~/mainconf/scripts/menus.sh
. ~/mainconf/scripts/functions.sh
        
        subMenu "MAINCONF -i3" "Enable Config files"

        createFolderAndAssignOwnership ~/.config/copyq $USER $USER && {
                cp ~/mainconf/varied/i3related/copyq/copyq.conf ~/.config/copyq/ && echo "|--> CopyQ enabled" && sleep 1
        }

        createFolderAndAssignOwnership ~/.config/Dharkael $USER $USER && {
                cp ~/mainconf/varied/i3related/flameshot/flameshot.ini ~/.config/Dharkael/ && echo "|--> Flameshot enabled" ; sleep 1
        }

        createFolderAndAssignOwnership ~/.config/vifm $USER $USER && {
                cp -r ~/mainconf/varied/vifm/themes ~/.config/vifm/colors/ &&
                cp ~/mainconf/varied/vifm/vifmrc ~/.config/vifm/ && echo "|--> Vifm enabled" ; sleep 1
        }

        checkFileExists /etc/xdg/picom.conf && sudo rm /etc/xdg/picom.conf
        sudo cp ~/mainconf/varied/i3related/picom/picom.conf /etc/xdg/ && changeOwnership $USER $USER /etc/xdg/picom.conf &&
        echo "|--> Picom compositor enabled" ; sleep 1

        createFolderAndAssignOwnership ~/.config/autorandr $USER $USER && {
                cp -r ~/mainconf/varied/monitors/autorandr/* ~/.config/autorandr && echo "|--> Autorandr profiles loaded" ; sleep 1
        }

        createFolderAndAssignOwnership ~/.config/polybar $USER $USER && {
                cp ~/mainconf/varied/i3related/polybar/config ~/.config/polybar/ &&
                cp ~/mainconf/varied/i3related/polybar/launch_polybar.sh ~/.config/polybar/ &&
                echo '|--> Polybar enabled' ; sleep 1
        }

        dconf load /com/gexperts/Tilix/ < ~/mainconf/varied/tilix/palenight.dconf &&
        echo "|--> Tilix enabled" ; sleep 1

        createFolderAndAssignOwnership ~/.config/rofi $USER $USER && {
                cp ~/mainconf/varied/i3related/rofi/config ~/.config/rofi/ && echo "|--> Rofi launcher enabled" ; sleep 1
        }

        createFolderAndAssignOwnership ~/.config/zathura $USER $USER && {
                cp ~/mainconf/varied/i3related/zathura/zathurarc ~/.config/zathura/ && echo "|--> Zathura enabled" ; sleep 1
        }

        createFolderAndAssignOwnership /etc/X11/xorg.conf.d $USER $USER && {
                cp ~/mainconf/varied/i3related/EnableTapToClick_touchpad/90-touchpad.conf /etc/X11/xorg.conf.d/ &&
                echo "|--> Tap to click enabled" ; sleep 1
        }
        
        createFolderAndAssignOwnership /etc/bluetooth $USER $USER && {
                cp ~/mainconf/varied/i3related/bluetooth/main.conf /etc/bluetooth/ && echo "|--> Bluetooth enabled" ; sleep 1
        }

        createFolderAndAssignOwnership ~/.config/i3 $USER $USER && {
                cp ~/mainconf/varied/i3related/i3config/config ~/.config/i3/ && echo "|--> i3 config enabled" ; sleep 1
        }
