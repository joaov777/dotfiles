#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sourcing necessary packages
. "$SCRIPT_DIR"/../scripts/menus.sh
. "$SCRIPT_DIR"/../scripts/functions.sh
        
        subMenu "Dotfiles" "Enable Config files"

        createFolderAndAssignOwnership "$HOME"/.config/ranger $USER $USER && {
                [ $(cp -r $SCRIPT_DIR/../config/i3related/ranger/ "$HOME"/.config/ranger 2>/dev/null) ] && 
                echo "|--> Ranger enabled" || echo "|--> Ranger not enabled"
	}
        createFolderAndAssignOwnership "$HOME"/.config/Dharkael $USER $USER && {
                [ $(cp $SCRIPT_DIR/../config/i3related/flameshot/flameshot.ini "$HOME"/.config/Dharkael/ 2>/dev/null) ] && 
                echo "|--> Flameshot enabled" || echo "|--> Flameshot not enabled"
        }

        createFolderAndAssignOwnership "$HOME"/.config/vifm $USER $USER && {
                [ $(cp -r $SCRIPT_DIR/../config/vifm/themes "$HOME"/.config/vifm/colors/ &&
                cp $SCRIPT_DIR/../config/vifm/vifmrc "$HOME"/.config/vifm/ 2>/dev/null) ] && 
                echo "|--> Vifm enabled" || echo "|--> Vifm not enabled"
        }

        createFolderAndAssignOwnership "$HOME"/.config/autorandr $USER $USER && {
                [ $(cp -r $SCRIPT_DIR/../config/monitors/autorandr/* "$HOME"/.config/autorandr 2>/dev/null) ] && 
                echo "|--> Autorandr profiles loaded" || echo "|--> Autorandr profiles not loaded"
        }

        createFolderAndAssignOwnership "$HOME"/.config/polybar $USER $USER && {
                [ $(cp $SCRIPT_DIR/../config/i3related/polybar/config "$HOME"/.config/polybar/ &&
                cp $SCRIPT_DIR/../config/i3related/polybar/launch_polybar.sh "$HOME"/.config/polybar/ 2>/dev/null) ] &&
                echo '|--> Polybar enabled' || echo "|--> Polybar not enabled"
        }

        createFolderAndAssignOwnership /usr/share/tilix/schemes $USER $USER && {
                [ $(dconf load /com/gexperts/Tilix/ < $SCRIPT_DIR/../../config/tilix/grape.dconf 2>/dev/null &&
                cp $SCRIPT_DIR/../config/tilix/themes/* /usr/share/tilix/schemes) ] &&
                echo "|--> Tilix config and themes enabled" || echo "|--> Tilix config and themes not enabled"
        }

        createFolderAndAssignOwnership "$HOME"/.config/rofi $USER $USER && {
                [ $(cp $SCRIPT_DIR/../config/i3related/rofi/config "$HOME"/.config/rofi/ 2>/dev/null) ] && 
                echo "|--> Rofi launcher enabled" || echo "|--> Rofi launcher not enabled"
        }

        createFolderAndAssignOwnership "$HOME"/.config/zathura $USER $USER && {
                [ $(cp $SCRIPT_DIR/../config/i3related/zathura/zathurarc "$HOME"/.config/zathura/ 2>/dev/null) ] && 
                echo "|--> Zathura enabled" || echo "|--> Zathura not enabled"
        }

        createFolderAndAssignOwnership /etc/X11/xorg.conf.d $USER $USER && {
                [ $(cp $SCRIPT_DIR/../config/i3related/EnableTapToClick_touchpad/90-touchpad.conf /etc/X11/xorg.conf.d/ 2>/dev/null) ] &&
                echo "|--> Tap to click enabled" || echo "|--> Tap to click not enabled"
        }

        createFolderAndAssignOwnership /etc/bluetooth $USER $USER && {
                [ $(cp $SCRIPT_DIR/../config/i3related/bluetooth/main.conf /etc/bluetooth/ 2>/dev/null) ] && 
                echo "|--> Bluetooth enabled" || echo "|--> Bluetooth not enabled"
        }

        [ $(cp $SCRIPT_DIR/../config/tmux/.tmux.conf "$HOME" 2>/dev/null) ] &&
                echo "|--> Tmux conf file enabled" || echo "Tmux conf file not enabled"

        [ $(cp -r $SCRIPT_DIR/../config/themes/* /usr/share/themes/ 2>/dev/null) ] &&
                echo "|--> Themes enabled" || echo "|--> Themes not enabled"

        [ $(cp -r $SCRIPT_DIR/../config/cursors/* /usr/share/icons/ 2>/dev/null) ] &&
                echo "|--> Cursor themes enabled" || echo "|--> Cursor themes not enabled"

        [ $(cp $SCRIPT_DIR/../config/notepadqq/Notepadqq.ini ~/.config/Notepadqq 2>/dev/null) ] &&
                echo "|--> Notepadqq config file enabled" || echo "|--> Notepadqq config file not enabled"

        createFolderAndAssignOwnership "$HOME"/.config/i3 $USER $USER && {
                [ $(cp $SCRIPT_DIR/../config/i3related/i3config/config ~/.config/i3/ 2>/dev/null) ] && 
                echo "|--> i3 config enabled"  || echo "i3 config not enabled"
        }


