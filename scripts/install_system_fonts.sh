#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sourcing necessary packages
. "$SCRIPT_DIR"/../scripts/menus.sh
. "$SCRIPT_DIR"/../scripts/functions.sh

FONTS_DIR="$HOME/.local/share/fonts"
        
        subMenu "Dotfiles" "Install System Fonts"

		[ -d "$FONTS_DIR" ] && rm -rf "$FONTS_DIR" 
		mkdir -p "$FONTS_DIR"

		cp -r "$SCRIPT_DIR"/../config/systemfonts/consolas/ "$FONTS_DIR"
		cp -r "$SCRIPT_DIR"/../config/systemfonts/jetbrains/ "$FONTS_DIR"
		cp -r "$SCRIPT_DIR"/../config/systemfonts/noto/ "$FONTS_DIR"
		cp -r "$SCRIPT_DIR"/../config/systemfonts/fontawesome5/ "$FONTS_DIR"
		cp -r "$SCRIPT_DIR"/../config/systemfonts/siji/ "$FONTS_DIR"

		fc-cache -f -v