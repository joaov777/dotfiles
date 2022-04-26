#!/bin/bash

  [[ "$#" -eq 0  ]] && {
    ls ~/dotfiles/config/tilix
  } || {
        [ $(ls ~/dotfiles/config/tilix | grep "$1") ] && {  
          dconf load /com/gexperts/Tilix/ < ~/dotfiles/config/tilix/$1.dconf
        } || {
          echo "Tilix Theme not defined!"
        }

  }
