#!/bin/bash

#check if file exists
function checkFileExists() {
    [ -f "$1" ]
}

#check if files exists and deletes it
function checkFileExistsAndDelete() {
    [ -f "$1" ] && sudo rm "$1"
}

#check if folder exists
function checkFolderExists() {
    [ -d "$1" ]
}

#if folder exists, deletes it and vice-versa
function checkFolderAutoReverse() {
    [ ! -d "$1" ] && sudo mkdir -p "$1" || sudo rm -rf "$1"
}

#create folder and assign ownership for group and user
function createFolderAndAssignOwnership() {
    [ -d "$1" ] && deleteFolder "$1"
    sudo mkdir "$1" && changeOwnership "$2" "$3" "$1" 
}

function deleteFolder() {
    sudo rm -rf "$1"
}

#check if user is root
function checkIfRoot() {
    [ "$(id -u)" -eq 0 ]
}

#change ownership to user - $1 for user, $2 for group and $3 for target
function changeOwnership() {
    sudo chown "$1":"$2" "$3"
}