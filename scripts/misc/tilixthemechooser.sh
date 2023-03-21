#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  [[ "$#" -eq 0  ]] && {
    ls "$SCRIPT_DIR"/../../config/tilix 
    #ls ~/dotfiles/config/tilix
  } || {
        [ $(ls "$SCRIPT_DIR"/../../config/tilix  | grep "$1") ] && {  
          dconf load /com/gexperts/Tilix/ < "$SCRIPT_DIR"/../../config/tilix/$1
        } || {
          echo "Tilix Theme not defined!"
        }

  }
