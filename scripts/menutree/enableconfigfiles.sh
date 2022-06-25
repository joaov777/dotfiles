#!/bin/bash

. ~/dotfiles/scripts/misc/menus.sh
. ~/dotfiles/scripts/misc/functions.sh
        
        subMenu "Dotfiles" "Enable Config files"

        createFolderAndAssignOwnership ~/.config/copyq $USER $USER && {
                cp ~/dotfiles/config/i3related/copyq/copyq.conf ~/.config/copyq/ && echo "|--> CopyQ enabled" && sleep 1
        }

        createFolderAndAssignOwnership ~/.config/Dharkael $USER $USER && {
                cp ~/dotfiles/config/i3related/flameshot/flameshot.ini ~/.config/Dharkael/ && echo "|--> Flameshot enabled" ; sleep 1
        }

        createFolderAndAssignOwnership ~/.config/vifm $USER $USER && {
                cp -r ~/dotfiles/config/vifm/themes ~/.config/vifm/colors/ &&
                cp ~/dotfiles/config/vifm/vifmrc ~/.config/vifm/ && echo "|--> Vifm enabled" ; sleep 1
        }

        checkFileExists /etc/xdg/picom.conf && sudo rm /etc/xdg/picom.conf
                sudo cp ~/dotfiles/config/i3related/picom/picom.conf /etc/xdg/ && changeOwnership $USER $USER /etc/xdg/picom.conf &&
                echo "|--> Picom compositor enabled" ; sleep 1

        createFolderAndAssignOwnership ~/.config/autorandr $USER $USER && {
                cp -r ~/dotfiles/config/monitors/autorandr/* ~/.config/autorandr && echo "|--> Autorandr profiles loaded" ; sleep 1
        }

        createFolderAndAssignOwnership ~/.config/polybar $USER $USER && {
                cp ~/dotfiles/config/i3related/polybar/config ~/.config/polybar/ &&
                cp ~/dotfiles/config/i3related/polybar/launch_polybar.sh ~/.config/polybar/ &&
                echo '|--> Polybar enabled' ; sleep 1
        }

        dconf load /com/gexperts/Tilix/ < ~/dotfiles/config/tilix/monowhite.dconf &&
                echo "|--> Tilix enabled" ; sleep 1

        createFolderAndAssignOwnership ~/.config/rofi $USER $USER && {
                cp ~/dotfiles/config/i3related/rofi/config ~/.config/rofi/ && echo "|--> Rofi launcher enabled" ; sleep 1
        }

        createFolderAndAssignOwnership ~/.config/zathura $USER $USER && {
                cp ~/dotfiles/config/i3related/zathura/zathurarc ~/.config/zathura/ && echo "|--> Zathura enabled" ; sleep 1
        }

        createFolderAndAssignOwnership /etc/X11/xorg.conf.d $USER $USER && {
                cp ~/dotfiles/config/i3related/EnableTapToClick_touchpad/90-touchpad.conf /etc/X11/xorg.conf.d/ &&

        sudo cp ~/dotfiles/config/i3related/picom/picom.conf /etc/xdg/ && changeOwnership $USER $USER /etc/xdg/picom.conf &&
                echo "|--> Picom compositor enabled" ; sleep 1

        createFolderAndAssignOwnership ~/.config/autorandr $USER $USER && {
                cp -r ~/dotfiles/config/monitors/autorandr/* ~/.config/autorandr && echo "|--> Autorandr profiles loaded" ; sleep 1
        }

        createFolderAndAssignOwnership ~/.config/polybar $USER $USER && {
                cp ~/dotfiles/config/i3related/polybar/config ~/.config/polybar/ &&
                cp ~/dotfiles/config/i3related/polybar/launch_polybar.sh ~/.config/polybar/ &&
                echo '|--> Polybar enabled' ; sleep 1
        }

        dconf load /com/gexperts/Tilix/ < ~/dotfiles/config/tilix/monowhite.dconf &&
                echo "|--> Tilix enabled" ; sleep 1

        createFolderAndAssignOwnership ~/.config/rofi $USER $USER && {
                cp ~/dotfiles/config/i3related/rofi/config ~/.config/rofi/ && echo "|--> Rofi launcher enabled" ; sleep 1
        }

        createFolderAndAssignOwnership ~/.config/zathura $USER $USER && {
                cp ~/dotfiles/config/i3related/zathura/zathurarc ~/.config/zathura/ && echo "|--> Zathura enabled" ; sleep 1
        }

        createFolderAndAssignOwnership /etc/X11/xorg.conf.d $USER $USER && {
                cp ~/dotfiles/config/i3related/EnableTapToClick_touchpad/90-touchpad.conf /etc/X11/xorg.conf.d/ &&
                echo "|--> Tap to click enabled" ; sleep 1
        }

        createFolderAndAssignOwnership /etc/bluetooth $USER $USER && {
                cp ~/dotfiles/config/i3related/bluetooth/main.conf /etc/bluetooth/ && echo "|--> Bluetooth enabled" ; sleep 1
        }

        createFolderAndAssignOwnership ~/.config/i3 $USER $USER && {
                cp ~/dotfiles/config/i3related/i3config/config ~/.config/i3/ && echo "|--> i3 config enabled" ; sleep 1
        }
