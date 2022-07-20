#!/bin/bash

. ~/dotfiles/scripts/misc/menus.sh
. ~/dotfiles/scripts/misc/functions.sh

FONTS_DIR="~/.local/share/fonts"
        
        subMenu "Dotfiles" "Install System Fonts"

		[ -d "$FONTS_DIR" ] && rm -rf "$FONTS_DIR" 
		mkdir -p "$FONTS_DIR"

		cp /home/$USER/dotfiles/config/systemfonts/consolas/con* "$FONTS_DIR"
		cp /home/$USER/dotfiles/config/systemfonts/jetbrains/Jet* "$FONTS_DIR"
		cp /home/$USER/dotfiles/config/systemfonts/noto/Noto* "$FONTS_DIR"

		fc-cache -f -v

		[ "$(fc-list | grep -E 'consolas*|Jet*|Noto*')" > /dev/null ] && {
			echo "|--> Fonts installed!" && sleep 1
		} || {
			echo "|--> Some fonts were not installed!" && sleep 1
		}

