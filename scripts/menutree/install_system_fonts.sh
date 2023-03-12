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
		cp /home/$USER/dotfiles/config/systemfonts/fonteawesome5/Font* "$FONTS_DIR"
		cp /home/$USER/dotfiles/config/systemfonts/siji/sij* "$FONTS_DIR"

		fc-cache -f -v