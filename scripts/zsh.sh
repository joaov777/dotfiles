#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT_HOME=$(cd $SCRIPT_DIR/../.. && pwd)

# sourcing necessary packages
. "$SCRIPT_DIR"/../menus.sh
. "$SCRIPT_DIR"/../functions.sh

clear
        
		subMenu "Dotfiles" "Install ZSH and update .zshrc"

		while true; do

			read -p "|--> Install zsh? (y/n) " zsh_option

			if [[ $zsh_option == [yY] ]]; then

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
				cp $SCRIPT_DIR/../../config/zsh/moody.zsh-theme ~/.oh-my-zsh/themes/
				#cp ~/dotfiles/config/zsh/moody.zsh-theme ~/.oh-my-zsh/themes/
				
				break

			elif [[ $zsh_option == [nN] ]]; then
				break
			else
				echo "|--> Insira uma opção válida!" && sleep 1
			fi

		done # end of loop

		while true; do

			read -p "|--> Update .zshrc? (y/n) " user_option

			if [[ $user_option == [yY] ]]; then
				checkFileExists ~/.zshrc && sudo rm ~/.zshrc 
				cp $SCRIPT_DIR/../../config/zsh/.zshrc /home/$USER && echo "|--> .zshrc restored" && sleep 1
				changeOwnership $USER $USER ~/.zshrc

				# updating project home folder on the .zshrc copy file located at the current user's home directory
				#sed -i "/PROJECT_HOME=/c\PROJECT_HOME="$SCRIPT_HOME"" /home/$USER/.zshrc
				
				# update the zsh shell
				#/bin/zsh -c ". ~/.zshrc"
				break

			elif [[ $user_option == [nN] ]]; then
				break
			else
				echo "|--> Insira uma opção válida!" && sleep 1
			fi

		done # end of loop
		

		
