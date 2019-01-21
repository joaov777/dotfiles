#!/bin/bash

	sudo pacman -S trizen --noconfirm
	sudo trizen -S git --noconfirm
	sudo trizen -S mellowplayer --noconfirm
	sudo trizen -S etcher --noconfirm
	sudo trizen -S notepadqq --noconfirm
	sudo trizen -S gparted --noconfirm
	sudo trizen -S keeweb-desktop --noconfirm
	sudo trizen -S ipscan --noconfirm 
	sudo trizen -S tilda --noconfirm
	sudo trizen -S upterm --noconfirm
	sudo trizen -S obs-studio --noconfirm
	sudo trizen -S filezilla --noconfirm
	sudo trizen -S gnome-pie --noconfirm
	sudo trizen -S telegram-desktop --noconfirm	
	sudo trizen -S google-chrome --noconfirm
	sudo trizen -S veracrypt --noconfirm
	sudo trizen -S ranger --noconfirm
	sudo trizen -S parcellite --noconfirm
	sudo trizen -S flameshot --noconfirm
	sudo trizen -S guake --noconfirm
	sudo trizen -S remmina --noconfirm
	sudo trizen -S skype-desktop-bin --noconfirm
	sudo trizen -S simplenote-electron-bin --noconfirm
	sudo trizen -S gedit --noconfirm
	sudo trizen -S barrier --noconfirm	
	sudo trizen -S anydesk --noconfirm
	sudo trizen -S pwgen --noconfirm
	sudo trizen -S openssh --noconfirm
	sudo trizen -S vim --noconfirm
	sudo trizen -S rdesktop --noconfirm
	sudo trizen -S ardour --noconfirm
	sudo trizen -S gtop --noconfirm
	sudo trizen -S mps-youtube --noconfirm
	sudo trizen -S translate-shell --noconfirm #trans -T = language table / trans :en "[Enter] Meu coracao e forte!"
	sudo trizen -S synapse --noconfirm 
	sudo trizen -S mtr --noconfirm
	sudo trizen -S nmap --noconfirm
	sudo trizen -S i3lock --noconfirm #set shortcut to: i3lock --color=000000
	sudo trizen -S plank --noconfirm
	sudo trizen -S evince --noconfirm
	sudo trizen -S caprine --noconfirm
	sudo trizen -S atom --noconfirm
	sudo trizen -S micro --noconfirm #terminal-based IDE
	sudo trizen -S neovim --noconfirm
	sudo trizen -S dynalist-desktop --noconfirm
	sudo trizen -S bmon --noconfirm

	#setting up Glances
	trizen -S python-bottle --noconfirm #used for glances
	trizen -S glances --noconfirm #awesome for monitoring
	#run glances -w (web server monitoring)
	
	#Setting up Keyboard layout
	#sudo keyboardctl -l br
	#trizen -S keyboardctl --noconfirm
	#setxkbmap br
	#kbctl -l br
	
	#setting up TeamViewer
	trizen -S teamviewer --noconfirm
	sudo teamviewer --daemon enable
	systemctl enable teamviewerd
	systemctl start teamviewerd
	
	#setting up time (NTP)
	trizen -S ntp --noconfirm
	sudo timedatectl set-ntp true
	sudo timedatectl set-timezone AmericaqFortaleza
	
	#setting up ZSH
	#trizen -S zsh --noconfirm
	#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	#sudo usermod -s /bin/zsh joao
	#sudo chsh -s /bin/zsh joao
	
	#setting up Ulauncher
	#trizen -S ulauncher --noconfirm
	## extensions for ulauncher
	#https://github.com/brpaz/ulauncher-file-search
	#https://github.com/isacikgoz/ukill
	#https://github.com/jetbug123/ulauncher-ssh
	#https://github.com/RolfKoenders/ulauncher-myip
	#https://github.com/manulaiko/ulauncher-openInBrowser
