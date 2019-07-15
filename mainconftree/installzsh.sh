#!/bin/bash

clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 2 - INSTALL ZSH -"
        read -p "Insert your username: " username

         #trizen -S zsh --noconfirm
	 sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	 sudo usermod -s /bin/zsh $username
	 sudo chsh -s /bin/zsh $username

        clear

	sleep 1

	    #installing zsh-autosuggestions plugin
		echo ">> Installing auto suggestions plugin"
	    cd ~/.oh-my-zsh/custom/plugins
	    git clone https://github.com/zsh-users/zsh-autosuggestions
		
		#installing pi theme https://github.com/tobyjamesthomas/pi
		echo ">> Installing zsh pi theme"
	    cd ~/.oh-my-zsh/custom/themes
	    git clone https://github.com/tobyjamesthomas/pi
	    cp pi/pi.zsh-theme .
	    sudo rm -rf pi
	    exec zsh
	    clear
	    cd ~
	    

