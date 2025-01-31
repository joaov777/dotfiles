#!/bin/bash

# Script: Dotfiles Management Script
# Description: This script provides a menu-driven interface to manage dotfiles, including setting up permissions, updating the system, installing packages, and more.

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source necessary scripts
. "$SCRIPT_DIR/scripts/menus.sh"
. "$SCRIPT_DIR/scripts/functions.sh"

# Function to prompt the user to press Enter to continue
function press_enter_to_continue() {
    read -p "Press enter to continue..."
}

# Define menu options and corresponding script paths
menu_options=(
    "Set up permissions"
    "Update System (Mirrors and packages)"
    "Install Yay AUR Helper"
    "Update packages"
    "Enable config files"
    "Manage ZSH"
    "Install system fonts"
)

menu_functions=(
    "$SCRIPT_DIR/scripts/permissions.sh"
    "$SCRIPT_DIR/scripts/updatesystems.sh"
    "$SCRIPT_DIR/scripts/install_yay_helper.sh"
    "$SCRIPT_DIR/scripts/updatepackagesi3.sh"
    "$SCRIPT_DIR/scripts/enableconfigfiles.sh"
    "$SCRIPT_DIR/scripts/zsh.sh"
    "$SCRIPT_DIR/scripts/install_system_fonts.sh"
)

# Main loop to display the menu and handle user input
while true; do
    clear
    # Display the menu title with the current working directory
    menu "Dotfiles (Working folder: $SCRIPT_DIR)"
    
    # Display menu options
    for ((i=0; i<${#menu_options[@]}; i++)); do
        echo "($((i+1))) - ${menu_options[i]}"
    done
    
    # Display a separator line
    line
    
    # Prompt the user for their choice
    read -p "Option: " user_option
    
    # Check if the user wants to quit
    if [[ "$user_option" =~ ^[Qq]$ ]] || [[ "$user_option" =~ ^[Qq][Uu][Ii][Tt]$ ]]; then
        exit 0
    fi
    
    # Validate the user input and execute the corresponding script
    if [[ "$user_option" =~ ^[1-9]$ ]] && (( user_option <= ${#menu_options[@]} )); then
        user_option=$((user_option - 1))
        # Execute the selected script
        bash "${menu_functions[$user_option]}"
        press_enter_to_continue
    else
        echo "Invalid input. Please try again."
        press_enter_to_continue
    fi
done
