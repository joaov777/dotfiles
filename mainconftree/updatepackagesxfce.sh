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
		        echo "|--> Trizen is installed" && sleep 1
	    fi
}


packages_required=(
	trizen keepassxc pdfarranger openssh tcpdump tldr fzf \
	visual-studio-code-bin bind-tools brave exa nerd-fonts-fira-code \
	git tilda notepadqq gparted papirus-folders-git woeusb \
	filezilla tilix telegram-desktop copyq flameshot ranger \
	gedit pwgen vim rdesktop i3lock mtr tmux font-manager unison ttf-windows \
	nmap okular viewnior ncdu inxi otf-fira-mono nordvpn-bin \
	veracrypt papirus-icon-theme neofetch xournalpp dialog \
	arp-scan net-tools teamviewer rclone peek krdc gvfs-smb thunar-shares-plugin-gtk3 gvfs 
	imagewriter albert wget dnsutils  
	)
	
	#legacy_packages
	#mypaint typora whatmask vinagre glances ngrep broot brave barrier 
	#sipcalc ipcalc redshift bat etcher micro guake vagrant virtualbox-bin vinagre obs-studio glow youtube-dl

check_installation() {
	if [ -z "$(pacman -Qi $1)" ]; then
		echo "|--> ERROR: Package $1 is NOT installed" && sleep 1
	else
		echo "|--> SUCCESS: Package $1 successfuly installed!!" && sleep 1
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
		echo "|--> $pkg is not installed!!" 
		echo "|--> Installing $pkg..." ; sleep 1
			trizen -S "$pkg" --noconfirm --needed
	
			#checking whether a package has successfuly been installed -
			check_installation "$pkg"
	else
		echo "|--> $pkg is already installed!!" > /dev/null #in case it is installed already
	fi
done

	#enabling sharing
	echo "|--> Enabling Samba permissions" ; sleep 1
	sudo smbpasswd -a $USER 
	papirus-folders -C white > /dev/null
	xdg-user-dirs-update

	#installing cursor themes
	echo "|--> Installing Cursor Themes" ; sleep 1
	sudo cp -r ~/mainconf/varied/cursors/* /usr/share/icons/

	#installing themes
	echo "|--> Installing Themes" ; sleep 1
	sudo cp -r ~/mainconf/varied/themes/* /usr/share/themes/

	#teamviewer related
	echo "|--> Enabling TeamViewer" ; sleep 1
	sudo teamviewer --daemon enable > /dev/null
	sudo systemctl enable teamviewerd.service --now > /dev/null

	#tmux related
	echo "|--> Setting up TMUX" ; sleep 1
	cp ~/mainconf/varied/tmux/.tmux.conf ~
	
	#notepadqq
	echo "|--> Setting up Notepadqq" ; sleep 1
	notepadqq=~/.config/Notepadqq
    [ -f $notepadqq/Notepadqq.ini ] && rm $notepadqq/Notepadqq.ini || mkdir -p $notepadqq
    cp ~/mainconf/varied/notepadqq/Notepadqq.ini $notepadqq && ln -sf ~/mainconf/varied/notepadqq/Notepadqq.ini $notepadqq

	#tilix
	echo "|--> Setting up Tilix" ; sleep 1
	dconf load /com/gexperts/Tilix/ < ~/mainconf/varied/tilix/tilix.dconf

	#albert
	echo "|--> Setting up Albert" ; sleep 1
	[ -f ~/.config/albert/albert.conf ] && rm ~/.config/albert/albert.conf 
	cp ~/mainconf/varied/albert/albert.conf ~/.config/albert
	pkill /usr/bin/albert > /dev/null

	#nord related
	echo "|--> Enabling and Starting VPN service" ; sleep 1
	sudo systemctl enable nordvpnd --now
	
    clear

