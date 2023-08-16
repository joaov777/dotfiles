#!/bin/bash

#check if file exists
checkFileExists() {
    [ -f "$1" ]
}

#check if files exists and deletes it
checkFileExistsAndDelete() {
    [ -f "$1" ] && sudo rm "$1"
}

#check if folder exists
checkFolderExists() {
    [ -d "$1" ]
}

#if folder exists, deletes it and vice-versa
checkFolderAutoReverse() {
    [ ! -d "$1" ] && sudo mkdir -p "$1" || sudo rm -rf "$1"
}

#create folder and assign ownership for group and user
createFolderAndAssignOwnership() {
    [ -d "$1" ] && deleteFolder "$1"
    sudo mkdir "$1" && changeOwnership "$2" "$3" "$1" 
}

deleteFolder() {
    sudo rm -rf "$1"
}

#check if user is root
checkIfRoot() {
    [ "$(id -u)" -eq 0 ]
}

#change ownership to user - $1 for user, $2 for group and $3 for target
changeOwnership() {
    sudo chown "$1":"$2" "$3"
}

isPackageInstalled() {
    if [ ! -z "$(pacman -Qi $1 2>/dev/null)" ]; then return 0; else return 1; fi
}

installYayHelper() {
    yay_dir="$HOME/yay"

    # if the package is not installed
    [ ! isPackageInstalled yay ] && {
            [ -d "$yay_dir" ] && sudo rm -rf "$yay_dir"
            sudo pacman -S --needed --noconfirm git base-devel && \
            git clone --quiet https://aur.archlinux.org/yay.git "$yay_dir" && cd "$yay_dir" && \
            makepkg -si && cd .. && \
            rm -rf "$yay_dir"

            # checking whether the package was successfully installed
            [ isPackageInstalled yay ] && {
                return 0
            } || {
                return 1
            }
    } || {
        # in case the package had already been installed
        return 0
    }

    
    
    

    

	
}