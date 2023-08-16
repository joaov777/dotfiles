#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sourcing necessary packages
. "$SCRIPT_DIR"/../scripts/menus.sh
. "$SCRIPT_DIR"/../scripts/functions.sh

FONTS_DIR="~/.local/share/fonts"
        
        subMenu "Dotfiles" "Install System Fonts"

		[ -d "$FONTS_DIR" ] && rm -rf "$FONTS_DIR" 
		mkdir -p "$FONTS_DIR"

		cp "$HOME"/dotfiles/config/systemfonts/consolas/con* "$FONTS_DIR"
		cp "$HOME"/dotfiles/config/systemfonts/jetbrains/Jet* "$FONTS_DIR"
		cp "$HOME"/dotfiles/config/systemfonts/noto/Noto* "$FONTS_DIR"
		cp "$HOME"/dotfiles/config/systemfonts/fonteawesome5/Font* "$FONTS_DIR"
		cp "$HOME"/dotfiles/config/systemfonts/siji/sij* "$FONTS_DIR"

		fc-cache -f -v