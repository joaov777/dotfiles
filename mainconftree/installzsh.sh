#!/bin/bash

clear
        
		echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF <|==============|"
        echo "|--------------> INSTALL ZSH <-------------|"
		sleep 1

	read -p "> Insert your username: " username

     trizen -S zsh --noconfirm --needed
	 yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	 sudo usermod -s /bin/zsh $username
	 sudo chsh -s /bin/zsh $username

        clear

	sleep 1

	    #installing zsh-autosuggestions plugin
		echo ">> Installing auto suggestions plugin"
	    cd ~/.oh-my-zsh/custom/plugins
	    git clone https://github.com/zsh-users/zsh-autosuggestions
		echo ">> ZSH Autosuggestions installed!!" ; sleep 2
		
		
		#installing pi theme https://github.com/tobyjamesthomas/pi
		echo ">> Installing zsh pi theme"
	    cd ~/.oh-my-zsh/custom/themes
	    git clone https://github.com/tobyjamesthomas/pi
	    cp pi/pi.zsh-theme .
	    sudo rm -rf pi
	    clear
	    cd ~
		echo ">> ZSH pi theme installed!!" ; sleep 2
	    

