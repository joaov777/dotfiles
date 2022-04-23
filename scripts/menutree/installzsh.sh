#!/bin/bash

. ~/dotfiles/scripts/misc/menus.sh

clear
        
		subMenu "Dotfiles" "Install ZSH"

		if [ -z "$(pacman -Qi zsh)" ]; then sudo pacman -S zsh --needed --noconfirm; else echo "|--> zsh already installed" && sleep 1; fi
	
		# if oh-my-zsh folder exists, deletes it
		echo "|--> Checking $HOME/.oh-my-zsh folder" ; sleep 1
		if [ -d ~/.oh-my-zsh ]; then sudo rm -rf ~/.oh-my-zsh ; fi

		# download oh-my-zsh
		yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &>/dev/null

		# change user default shell to zsh
		sudo chsh -s /bin/zsh $USER #sudo usermod -s /bin/zsh $USER
		
	    	# installing zsh-autosuggestions plugin
		echo "|--> Installing auto suggestions plugin" ; sleep 1
		if [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then sudo rm -rf ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions; fi
		git clone --quiet https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
		
		# installing powerline fonts
		echo "|--> Downloading Powerline fonts" ; sleep 1
		git clone --quiet https://github.com/powerline/fonts.git $HOME/.local/share/fonts/ &>/dev/null
		$HOME/.local/share/fonts/install.sh &>/dev/null
	
		# installing pi theme https://github.com/tobyjamesthomas/pi
		echo "|--> Installing custom zsh theme - moody" ; sleep 1
		cp ~/dotfiles/config/zsh/moody.zsh-theme ~/.oh-my-zsh/custom/themes/
