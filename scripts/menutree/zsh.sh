#!/bin/bash

. ~/dotfiles/scripts/misc/menus.sh
. ~/dotfiles/scripts/misc/functions.sh

clear
        
		subMenu "Dotfiles" "Install ZSH and update .zshrc"

		while [ true ];
        do

		read -p "Update .zshrc? (y/n) " user_option
		case $user_option in 
			yes|YES|Yes|yES|yEs|YeS|yeS|YEs) 
				checkFileExists ~/.zshrc && sudo rm ~/.zshrc 
				sudo cp ~/dotfiles/config/zsh/.zshrc /home/$USER && echo "|--> .zshrc restored" 
				changeOwnership $USER $USER ~/.zshrc
			;;

			no|NO|No|nO) exit 1 ;;
			*) echo "|--> Insira uma opção válida!" && sleep 1 ;;
        esac
		done

		while [ true ];
        do

		read -p "|--> Install zsh? (y/n) " zsh_option
		case $zsh_option in 
			yes|YES|Yes|yES|yEs|YeS|yeS|YEs) 

				[ $(isPackageInstalled zsh) ] && echo "|--> zsh already installed" || echo "|--> Installing zsh..." && sudo pacman -S zsh --needed --noconfirm
			
				# if oh-my-zsh folder exists, deletes it
				echo "|--> Checking $HOME/.oh-my-zsh folder" 
				if [ -d ~/.oh-my-zsh ]; then sudo rm -rf ~/.oh-my-zsh ; fi

				# download oh-my-zsh
				yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &>/dev/null

				# change user default shell to zsh
				sudo chsh -s /bin/zsh $USER #sudo usermod -s /bin/zsh $USER
				
					# installing zsh-autosuggestions plugin
				echo "|--> Installing Auto-Suggestions plugin" 
				git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

				echo "|--> Installing Syntax-Highlighting..."
				git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

				echo "|--> Installing Zsh-Completions plugin..."
				git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
			
				# installing pi theme https://github.com/tobyjamesthomas/pi
				echo "|--> Installing custom zsh theme - moody" 
				cp ~/dotfiles/config/zsh/moody.zsh-theme ~/.oh-my-zsh/themes/
				
				;;

			no|NO|No|nO) exit 1 ;;
			*) echo "|--> Insira uma opção válida!" && sleep 1 ;;
        esac
		done
		

		
