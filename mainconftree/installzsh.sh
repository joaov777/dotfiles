#!/bin/bash

clear
        
		echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF <|==============|"
        echo "|--------------> INSTALL ZSH <-------------|"
		sleep 1

		read -p "> Insert your username: " username	

		if pacman -Qi trizen > /dev/null 2>&1 ; then
			trizen -S zsh --noconfirm --needed
		else
  			sudo pacman -S zsh --noconfirm --needed
		fi

		echo "|---> Checking $HOME/.oh-my-zsh folder" ; sleep 1
		if [ -d ~/.oh-my-zsh ]; then sudo rm -rf ~/.oh-my-zsh ; fi

		yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		sudo usermod -s /bin/zsh $username
		sudo chsh -s /bin/zsh $username

	    #installing zsh-autosuggestions plugin
		echo "|---> Installing auto suggestions plugin"
		if [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
		sudo rm -rf ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
		fi
		git clone --quiet https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
		echo "|---> ZSH Autosuggestions installed!!" ; sleep 2
		
	
		#installing pi theme https://github.com/tobyjamesthomas/pi
		echo "|---> Installing zsh pi theme"
	    if [ -d ~/.oh-my-zsh/custom/themes/pi ]; then
		sudo rm -rf ~/.oh-my-zsh/custom/themes/pi
		fi
	    
		wget -O /home/joao/.oh-my-zsh/custom/themes/pi.zsh-theme https://raw.githubusercontent.com/joaov777/mainconf/master/zsh/pi.zsh-theme

		echo "|---> ZSH pi theme installed!!" ; sleep 2

		
	
		
	    

