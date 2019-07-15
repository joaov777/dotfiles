#!/bin/bash

        clear
        echo '########## MAIN CONF ##########'
        echo "- ## UPDATE SYSTEM ## -"
        sleep 1

            sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu --noconfirm

        clear