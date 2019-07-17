#!/bin/bash

    cd ~ 
    git clone https://aur.archlinux.org/trizen-git.git
    cd trizen-git
    yes | makepkg -si

    cd ..
    rm -rf trizen-git
    
