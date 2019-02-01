#!/bin/bash

	sudo pacman -S trizen --noconfirm
	trizen -S git --noconfirm
	trizen -S mellowplayer --noconfirm
	trizen -S etcher --noconfirm
	trizen -S notepadqq --noconfirm
	trizen -S gparted --noconfirm
	trizen -S keeweb-desktop --noconfirm
	trizen -S ipscan --noconfirm 
	trizen -S tilda --noconfirm
	trizen -S upterm --noconfirm
	trizen -S obs-studio --noconfirm
	trizen -S filezilla --noconfirm
	trizen -S gnome-pie --noconfirm
	trizen -S telegram-desktop --noconfirm	
	trizen -S google-chrome --noconfirm
	trizen -S veracrypt --noconfirm
	trizen -S ranger --noconfirm
	trizen -S parcellite --noconfirm
	trizen -S flameshot --noconfirm
	trizen -S guake --noconfirm
	trizen -S remmina --noconfirm
	#trizen -S skype-desktop-bin --noconfirm
	trizen -S skypeforlinux-preview-bin --noconfirm
	trizen -S simplenote-electron-bin --noconfirm
	trizen -S gedit --noconfirm
	trizen -S barrier --noconfirm	
	trizen -S anydesk --noconfirm
	trizen -S pwgen --noconfirm
	trizen -S openssh --noconfirm
	trizen -S vim --noconfirm
	trizen -S rdesktop --noconfirm
	trizen -S ardour --noconfirm
	trizen -S gtop --noconfirm
	trizen -S mps-youtube --noconfirm
	trizen -S translate-shell --noconfirm #trans -T = language table / trans :en "[Enter] Meu coracao e forte!"
	trizen -S synapse --noconfirm 
	trizen -S mtr --noconfirm
	trizen -S nmap --noconfirm
	trizen -S i3lock --noconfirm #set shortcut to: i3lock --color=000000
	trizen -S plank --noconfirm
	trizen -S evince --noconfirm
	trizen -S caprine --noconfirm
	trizen -S atom --noconfirm
	trizen -S micro --noconfirm #terminal-based IDE
	trizen -S neovim --noconfirm
	trizen -S dynalist-desktop --noconfirm
	trizen -S bmon --noconfirm
	trizen -S mypaint --noconfirm
	trizen -S viber --noconfirm
	trizen -S typora --noconfirm
	trizen -S okular --noconfirm #pdfviewer	
	trizen -S snes9x-gtk #snes emulator

	#setting up Glances
	trizen -S python-bottle --noconfirm #used for glances
	trizen -S glances --noconfirm #awesome for monitoring
	#sudo glances -w (web server monitoring)
	#sudo glances -w --username --password --port 2222 (example)
	
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
