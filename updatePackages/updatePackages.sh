#!/bin/bash

#list of packages
packages_required=(
	git tilda etcher notepadqq gparted keeweb-desktop \ 
	filezilla telegram-desktop clipit flameshot guake \
	gedit pwgen openssh vim rdesktop i3lock synapse mtr \
	nmap okular viewnior ncdu inxi otf-fira-mono \
	pdfarranger-git ipcalc sipcalc whatmask veracrypt \
	obs-studio arp-scan net-tools visual-studio-code-bin \
	google-chrome teamviewer keyboardctl \
	papirus-icon-theme papirus-folders-git			
					)

for pkg in "${packages_required[@]}"; do
	clear
	echo "$(tput bold)$(tput setaf 7)"
	echo "|==============|> MAINCONF <|==============|"
	echo "|------------> UPDATE PACKAGES <-----------|"

	if [ -z "$(pacman -Qi $pkg)" ]; then #in case it is not installed
		echo ">> $pkg is not installed!!" ; sleep 1
		echo ">> Installing $pkg..." ; sleep 1
		trizen -S "$pkg" --noconfirm --needed #>> /dev/null
		
			#checking whether a package has successfuly been installed
			if [ -z "$(pacman -Qi $pkg)" ]; then
				echo ">> ERROR: Package not installed" ; sleep 2
			else
				echo ">> SUCCESS: Package $pkg installed!!" ; sleep 2
			fi
	else
		echo ">> $pkg is installed!!" ; sleep 1 #in case it is installed already
	fi
done

	sudo teamviewer --daemon enable
	sudo systemctl enable teamviewerd.service
	sudo systemctl start teamveiwerd.service

	sudo papirus-folders -C grey 

#################################
#################################
	

	