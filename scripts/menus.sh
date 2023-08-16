#!/bin/bash

function menu() {
    clear
    echo "$(tput bold)$(tput setaf 7)"
    echo "|--------- $1"
}

function subMenu() {
    clear
    echo "$(tput bold)$(tput setaf 7)"
    echo "|--------- $1"
    echo "|-- $2"
}

function line() { 
    echo "|-------------------------------------------|"
}