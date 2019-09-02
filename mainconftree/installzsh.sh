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

	    #installing zsh-autosuggestions plugin
		echo ">> Installing auto suggestions plugin"
		if [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
		sudo rm -rf ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
		fi
		git clone --quiet https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
		echo ">> ZSH Autosuggestions installed!!" ; sleep 2
		
	
		#installing pi theme https://github.com/tobyjamesthomas/pi
		echo ">> Installing zsh pi theme"
	    if [ -d ~/.oh-my-zsh/custom/themes/pi ]; then
		sudo rm -rf ~/.oh-my-zsh/custom/themes/pi
		fi
	    git clone --quiet https://github.com/tobyjamesthomas/pi ~/.oh-my-zsh/custom/themes/pi
	    cp ~/.oh-my-zsh/custom/themes/pi/pi.zsh-theme ~/.oh-my-zsh/custom/themes/
	    sudo rm -rf ~/.oh-my-zsh/custom/themes/pi/
		echo ">> ZSH pi theme installed!!" ; sleep 2

		
	
		
	    

