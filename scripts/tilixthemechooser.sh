#!/bin/bash

  [[ "$#" -eq 0  ]] && {
    ls ~/mainconf/varied/tilix
  } || {
        [ $(ls ~/mainconf/varied/tilix | grep "$1") ] && {  
          dconf load /com/gexperts/Tilix/ < ~/mainconf/varied/tilix/$1.dconf
        } || {
          echo "Tilix Theme not defined!"
        }

  }
