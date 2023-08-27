#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sourcing necessary packages
. "$SCRIPT_DIR"/../scripts/menus.sh
. "$SCRIPT_DIR"/../scripts/functions.sh
        
        subMenu "Dotfiles" "Enable Config files"

        createFolderAndAssignOwnership "$HOME"/.config/ranger $USER $USER && {
                if cp -r $SCRIPT_DIR/../config/i3related/ranger/ "$HOME"/.config/ranger 2>/dev/null; then
                echo "|--> Ranger enabled"; else echo "|--> Ranger not enabled"; fi
	}
        createFolderAndAssignOwnership "$HOME"/.config/Dharkael $USER $USER && {
                if cp -r $SCRIPT_DIR/../config/i3related/flameshot/flameshot.ini "$HOME"/.config/Dharkael/ 2>/dev/null; then
                echo "|--> Flameshot enabled"; else echo "|--> Flameshot not enabled"; fi
        }

        createFolderAndAssignOwnership "$HOME"/.config/vifm $USER $USER && {
                if cp -r $SCRIPT_DIR/../config/vifm/themes "$HOME"/.config/vifm/colors/ &&
                cp $SCRIPT_DIR/../config/vifm/vifmrc "$HOME"/.config/vifm/ 2>/dev/null; then
                echo "|--> Vifm enabled"; else echo "|--> Vifm not enabled"; fi
        }

        createFolderAndAssignOwnership "$HOME"/.config/polybar $USER $USER && {
                if cp -r $SCRIPT_DIR/../config/i3related/polybar/config "$HOME"/.config/polybar/ &&
                cp $SCRIPT_DIR/../config/i3related/polybar/launch_polybar.sh "$HOME"/.config/polybar/ 2>/dev/null; then
                echo '|--> Polybar enabled'; else echo "|--> Polybar not enabled"; fi
        }

        createFolderAndAssignOwnership /usr/share/tilix/schemes $USER $USER && {
                if $(dconf load /com/gexperts/Tilix/ < $SCRIPT_DIR/../config/tilix/grape.dconf 2>/dev/null &&
                cp -r $SCRIPT_DIR/../config/tilix/themes/* /usr/share/tilix/schemes); then
                echo "|--> Tilix config and themes enabled"; else echo "|--> Tilix config and themes not enabled"; fi
        }

        createFolderAndAssignOwnership "$HOME"/.config/rofi $USER $USER && {
                if cp -r $SCRIPT_DIR/../config/i3related/rofi/config "$HOME"/.config/rofi/ 2>/dev/null; then
                echo "|--> Rofi launcher enabled"; else echo "|--> Rofi launcher not enabled"; fi
        }

        createFolderAndAssignOwnership "$HOME"/.config/zathura $USER $USER && {
                if cp -r $SCRIPT_DIR/../config/i3related/zathura/zathurarc "$HOME"/.config/zathura/ 2>/dev/null; then 
                echo "|--> Zathura enabled"; else echo "|--> Zathura not enabled"; fi
        }

        createFolderAndAssignOwnership /etc/X11/xorg.conf.d $USER $USER && {
                if cp -r $SCRIPT_DIR/../config/i3related/EnableTapToClick_touchpad/90-touchpad.conf /etc/X11/xorg.conf.d/ 2>/dev/null; then
                echo "|--> Tap to click enabled"; else echo "|--> Tap to click not enabled"; fi
        }

        createFolderAndAssignOwnership /etc/bluetooth $USER $USER && {
                if cp -r $SCRIPT_DIR/../config/i3related/bluetooth/main.conf /etc/bluetooth/ 2>/dev/null; then
                echo "|--> Bluetooth enabled"; else echo "|--> Bluetooth not enabled"; fi
        }

        if cp -r $SCRIPT_DIR/../config/tmux/.tmux.conf "$HOME" 2>/dev/null; then
                echo "|--> Tmux conf file enabled"; else echo "|--> Tmux conf file not enabled"; fi

        if mkdir -p "$HOME/.local/share/themes" && cp -r $SCRIPT_DIR/../config/themes/* "$HOME/.local/share/themes" 2>/dev/null; then
                echo "|--> Themes enabled"; else echo "|--> Themes not enabled"; fi

        if mkdir -p "$HOME/.local/share/icons" && cp -r $SCRIPT_DIR/../config/cursors/* "$HOME/.local/share/icons" 2>/dev/null; then
                echo "|--> Cursor themes enabled"; else echo "|--> Cursor themes not enabled"; fi

        # if mkdir -p "$HOME/.config/notepadqq" && cp -r $SCRIPT_DIR/../config/notepadqq/Notepadqq.ini "$HOME/.config/notepadqq" 2>/dev/null; then
        #         echo "|--> Notepadqq config file enabled"; else echo "|--> Notepadqq config file not enabled"; fi

        createFolderAndAssignOwnership "$HOME"/.config/i3 $USER $USER && {
                if cp -r $SCRIPT_DIR/../config/i3related/i3config/config ~/.config/i3/ 2>/dev/null; then
                echo "|--> i3 config enabled"; else echo "|--> i3 config not enabled"; fi
        }