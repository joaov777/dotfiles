#!/bin/bash

clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 3 - UPDATE .ZSHRC -"
        sleep 1

            cat ~/mainconf/zsh/.zshrc > ~/.zshrc
            sudo ln -sf ~/mainconf/zsh/.zshrc ~/.zshrc

        clear