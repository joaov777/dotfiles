#!/bin/bash

install_trizen() {
        
		clear
		echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> MAINCONF <|==============|"
        echo "|------------> UPDATE PACKAGES <-----------|"

        if [ -z "$(pacman -Qi trizen)" ];
	    then
		        cd ~ 
                echo ">> Trizen is not installed!!" ; sleep 1
                echo ">> Installing Trizen AUR Helper" ; sleep 1
                git clone https://aur.archlinux.org/trizen.git >> /dev/null
                cd trizen
                makepkg -si

                cd ..
                rm -rf trizen

	    else
		        echo ">> trizen is installed!!" ; sleep 1
	    fi
}


packages_required=(
	trizen keeweb pdfarranger openssh tcpdump tldr fzf \
	visual-studio-code-bin google-chrome bind-tools \
	git tilda notepadqq gparted papirus-folders-git \
	filezilla telegram-desktop copyq flameshot ranger \
	gedit pwgen openssh vim rdesktop i3lock mtr tmux \
	nmap okular viewnior ncdu inxi otf-fira-mono nordvpn-bin \
	veracrypt papirus-icon-theme neofetch \
	arp-scan net-tools teamviewer rclone peek \ 
	imagewriter albert wget dnsutils  
	)
	
	#legacy_packages
	#mypaint typora whatmask vinagre glances ngrep broot brave barrier 
	#sipcalc ipcalc redshift bat etcher micro guake vagrant virtualbox-bin vinagre obs-studio glow youtube-dl

check_installation() {
	if [ -z "$(pacman -Qi $1)" ]; then
		echo ">> ERROR: Package $1 is NOT installed" ; sleep 1
	else
		echo ">> SUCCESS: Package $1 successfuly installed!!" ; sleep 1
	fi
}
	#installing trizen
	install_trizen

for pkg in "${packages_required[@]}"; do
	clear
	echo "$(tput bold)$(tput setaf 7)"
	echo "|==============|> MAINCONF <|==============|"
	echo "|------------> UPDATE PACKAGES <-----------|"

	if [ -z "$(pacman -Qi $pkg)" ]; then #in case it is not installed
		echo "|---> $pkg is not installed!!" 
		echo "|---> Installing $pkg..." ; sleep 1
			#trizen -S "$pkg" --noconfirm --needed &>/dev/null
			trizen -S "$pkg" --noconfirm --needed
	
			#checking whether a package has successfuly been installed -
			check_installation "$pkg"
	else
		echo "|---> $pkg is installed!!" ; sleep 1 #in case it is installed already
	fi
done

	#<< script continues from this point on >>

	#enabling sharing
	sudo pacman -S gvfs-smb thunar-shares-plugin-gtk3 --noconfirm --needed 
	sudo smb passwd -a joao

	#for Thunar
	sudo pacman -S gvfs gvfs-samba gvfs-mtp xdg-users-dirs --noconfirm --needed
	xdg-user-dirs-update

	#installing cursor themes
	sudo cp -r ~/mainconf/varied/cursors/* /usr/share/icons/

	#installing themes
	sudo cp -r ~/mainconf/varied/themes/* /usr/share/themes/

	#teamviewer related
	sudo teamviewer --daemon enable
	sudo systemctl enable teamviewerd.service --now

	#tmux related
	cp ~/mainconf/varied/tmux/.tmux.conf ~

	#nord related
	sudo systemctl enable nordvpnd --now

	#printing related - install manually on the 'print settings' GUI
	#sudo pacman -S manjaro-printer
	#sudo gpasswd $USER sys
	#sudo systemctl enable --now org.cups.cupsd.service

	sudo papirus-folders -C black 

    clear

#################################
#################################
	
# MAIN PACKAGES 
#	trizen -S git --noconfirm --needed
#	trizen -S tilda --noconfirm --needed
#	trizen -S etcher --noconfirm --needed
#	trizen -S notepadqq --noconfirm --needed
#	trizen -S gparted --noconfirm --needed
#	trizen -S keeweb-desktop --noconfirm --needed
#	trizen -S filezilla --noconfirm --needed
#	trizen -S telegram-desktop --noconfirm --needed
#	trizen -S clipit --noconfirm --needed
#	trizen -S flameshot --noconfirm --needed
#	trizen -S guake --noconfirm --needed
#	trizen -S gedit --noconfirm --needed
#	trizen -S pwgen --noconfirm --needed
#	trizen -S openssh --noconfirm --needed
#	trizen -S vim --noconfirm --needed
#	trizen -S rdesktop --noconfirm --needed
#	trizen -S i3lock --noconfirm --needed #set shortcut to: i3lock --color=000000
#	trizen -S synapse --noconfirm --needed
#	trizen -S mtr --noconfirm --needed
#	trizen -S nmap --noconfirm --needed
#	trizen -S okular --noconfirm --needed #pdfviewer	
#	trizen -S viewnior --noconfirm --needed #image viewer
#	trizen -S ncdu --noconfirm --needed 
#	trizen -S inxi --noconfirm --needed
#	trizen -S otf-fira-mono --noconfirm --needed
#	trizen -S pdfarranger-git --noconfirm --needed #awesome tool for pdf arrangement
#	trizen -S ipcalc --noconfirm --needed
#	trizen -S sipcalc --noconfirm --needed #sipcalc -a 10.10.10.10/27
#	trizen -S whatmask --noconfirm --needed #ex.: whatmask /27 # whatmask 10.10.10.10/28 
#	trizen -S veracrypt --noconfirm --needed
#	trizen -S obs-studio --noconfirm --needed
#	trizen -S arp-scan --noconfirm --needed
#	trizen -S net-tools --noconfirm --needed
#	trizen -S visual-studio-code-bin --noconfirm --needed
#	trizen -S google-chrome --noconfirm --needed


	#Downloading papirus icon themes and setting up to grey - -
	#papirus-folders -l --theme Papirus-Dark (Listando cores disponíveis)
	#trizen -S papirus-icon-theme --noconfirm --needed
	#trizen -S papirus-folders-git --noconfirm --needed
	#sudo papirus-folders -C grey 

	#Setting up Teamviewer
	#trizen -S teamviewer --noconfirm --needed
	#sudo teamviewer --daemon enable
	#sudo systemctl enable teamviewerd.service
	#sudo systemctl start teamveiwerd.service



	#setting up Glances
	#trizen -S python-bottle --noconfirm #used for glances
	#trizen -S glances --noconfirm #awesome for monitoring
	#sudo glances -w (web server monitoring)
	#sudo glances -w --username --password --port 2222 (example)

	#Setting up Keyboard layout
	#sudo keyboardctl -l br
	#trizen -S keyboardctl --noconfirm --needed
	#setxkbmap br
	#kbctl -l br

	#setting up time (NTP)
	#trizen -S ntp --noconfirm
	#sudo timedatectl set-ntp true
	#sudo timedatectl set-timezone America/Fortaleza

	#trizen -S skypeforlinux-preview-bin --noconfirm
	#trizen -S snes9x-gtk --noconfirm #snes emulator
	#trizen -S scrot --noconfirm
	#trizen -S barrier --noconfirm	
	#trizen -S anydesk --noconfirm
	#trizen -S remmina --noconfirm
	#trizen -S simplenote-electron-bin --noconfirm
	#trizen -S ranger --noconfirm
	#trizen -S micro --noconfirm #terminal-based IDE
	#trizen -S abntex2 --noconfirm #for latex
	#trizen -S i3lock-fancy-git --noconfirm #i3lock-fancy -- scrot -z
	#trizen -S gnome-pie --noconfirm
	#trizen -S ipscan --noconfirm 
	#trizen -S upterm --noconfirm
	#trizen -S evince --noconfirm
	#trizen -S caprine --noconfirm
	#trizen -S atom --noconfirm
	#trizen -S neovim --noconfirm
	#trizen -S mypaint --noconfirm
	#trizen -S viber --noconfirm
	#trizen -S typora --noconfirm
	#trizen -S oranchelo-icon-theme-git #oranchelo icon theme
	#trizen -S translate-shell --noconfirm #trans -T = language table / trans :en [Enter]Meucoracaoeforte!
	#trizen -S mellowplayer --noconfirm
