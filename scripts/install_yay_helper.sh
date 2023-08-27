#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sourcing necessary packages
. "$SCRIPT_DIR"/../scripts/menus.sh
. "$SCRIPT_DIR"/../scripts/functions.sh

subMenu "Dotfiles" "Install AUR Helper" 

    yay_dir="$HOME/yay"

    # if the package is not installed
    if ! isPackageInstalled yay; then

        echo "|--> Yay has not been installed yet!" ; sleep 2
        [ -d "$yay_dir" ] && sudo rm -rf "$yay_dir"
        sudo pacman -S --needed --noconfirm git base-devel && \
        git clone --quiet https://aur.archlinux.org/yay.git "$yay_dir" && cd "$yay_dir" && \
        makepkg -si && cd .. && \
        rm -rf "$yay_dir"

        # checking whether the package was successfully installed
        if isPackageInstalled yay; then
            echo "|--> Yay successfully installed!" ; sleep 2
        else
            echo "|--> Yay not installed!" ; sleep 2
        fi
    else    
        echo "|--> Yay has already been installed!" ; sleep 2
	fi