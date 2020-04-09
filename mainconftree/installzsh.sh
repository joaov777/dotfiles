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

		echo "|---> Checking $HOME/.oh-my-zsh folder" ; sleep 2
		if [ -d ~/.oh-my-zsh ]; then sudo rm -rf ~/.oh-my-zsh ; fi

		yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		sudo usermod -s /bin/zsh $username
		sudo chsh -s /bin/zsh $username

	    #installing zsh-autosuggestions plugin
		echo "|---> Installing auto suggestions plugin" ; sleep 2
		if [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
		sudo rm -rf ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
		fi
		git clone --quiet https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
		echo "|---> ZSH Autosuggestions installed!!" ; sleep 2
		
		#installing powerline fonts
		echo "|---> Downloading Powerline fonts" ; sleep 2
		git clone --quiet https://github.com/powerline/fonts.git $HOME/.local/share/fonts/
		$HOME/.local/share/fonts/install.sh
		echo "|---> Powerline fonts installed!!" ; sleep 2
	
		#installing pi theme https://github.com/tobyjamesthomas/pi
		echo "|---> Installing zsh pi theme" ; sleep 2
	    if [ -d ~/.oh-my-zsh/custom/themes/pi ]; then
		sudo rm -rf ~/.oh-my-zsh/custom/themes/pi
		fi
	    
		wget -O ~/.oh-my-zsh/custom/themes/pi.zsh-theme https://raw.githubusercontent.com/joaov777/mainconf/master/zsh/pi.zsh-theme
		echo "|---> ZSH pi theme installed!!" ; sleep 2

		
	
		
	    

