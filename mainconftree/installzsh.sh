#!/bin/bash

clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 2 - INSTALL ZSH -"
        read -p "Insert your username: " username

          trizen -S zsh --noconfirm
	        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	        sudo usermod -s /bin/zsh $username
	        sudo chsh -s /bin/zsh $username

        clear

        sleep 1

            cat ~/mainconf/zsh/.zshrc > ~/.zshrc
            sudo ln -sf ~/mainconf/zsh/.zshrc ~/.zshrc

	sleep 1

	    #installing zsh-autosuggestions plugin
	    cd ~/.oh-my-zsh/custom/plugins
	    git clone https://github.com/zsh-users/zsh-autosuggestions
	    exec zsh
