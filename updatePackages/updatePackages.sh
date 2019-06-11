#!/bin/bash

	sudo pacman -S trizen --noconfirm
	trizen -S git --noconfirm
	trizen -S mellowplayer --noconfirm
	trizen -S etcher --noconfirm
	trizen -S notepadqq --noconfirm
	trizen -S gparted --noconfirm
	trizen -S keeweb-desktop --noconfirm
	trizen -S filezilla --noconfirm
	trizen -S telegram-desktop --noconfirm	
	trizen -S google-chrome --noconfirm
	trizen -S ranger --noconfirm
	trizen -S parcellite --noconfirm
	trizen -S flameshot --noconfirm
	trizen -S guake --noconfirm
	trizen -S remmina --noconfirm
	trizen -S simplenote-electron-bin --noconfirm
	trizen -S gedit --noconfirm
	trizen -S barrier --noconfirm	
	trizen -S anydesk --noconfirm
	trizen -S pwgen --noconfirm
	trizen -S openssh --noconfirm
	trizen -S vim --noconfirm
	trizen -S rdesktop --noconfirm
	trizen -S scrot --noconfirm
	trizen -S i3lock --noconfirm #set shortcut to: i3lock --color=000000
	trizen -S synapse --noconfirm 
	trizen -S mtr --noconfirm
	trizen -S nmap --noconfirm
	trizen -S okular --noconfirm #pdfviewer	
	trizen -S viewnior --noconfirm #image viewer
	trizen -S ncdu --noconfirm 
	trizen -S inxi --noconfirm
	trizen -S otf-fira-mono --noconfirm
	trizen -S visual-studio-code-bin --noconfirm
	trizen -S pdfarranger-git --noconfirm #awesome tool for pdf arrangement
	trizen -S ipcalc --noconfirm
	trizen -S sipcalc --noconfirm #sipcalc -a 10.10.10.10/27
	trizen -S whatmask --noconfirm #ex.: whatmask /27 # whatmask 10.10.10.10/28 
	trizen -S shc --noconfirm #useful for encrypting scripts Ex.: shc -f <file_path>
	trizen -S veracrypt --noconfirm
	trizen -S skypeforlinux-preview-bin --noconfirm
	trizen -S obs-studio --noconfirm
	trizen -S snes9x-gtk --noconfirm#snes emulator
	trizen -S vinagre --noconfirm #rdp clientvina
	trizen -S arp-scan --noconfirm

	#Setting up Teamviewer
	trizen -S teamviewer --noconfirm
	sudo teamviewer --daemon enable
	systemctl enable teamviewerd
	systemctl start teamviewerd

	#setting up Glances
	#trizen -S python-bottle --noconfirm #used for glances
	#trizen -S glances --noconfirm #awesome for monitoring
	#sudo glances -w (web server monitoring)
	#sudo glances -w --username --password --port 2222 (example)

	#Setting up Keyboard layout
	#sudo keyboardctl -l br
	trizen -S keyboardctl --noconfirm
	#setxkbmap br
	#kbctl -l br

	#setting up time (NTP)
	#trizen -S ntp --noconfirm
	#sudo timedatectl set-ntp true
	#sudo timedatectl set-timezone America/Fortaleza

	#trizen -S micro --noconfirm #terminal-based IDE
	#trizen -S abntex2 --noconfirm #for latex
	#trizen -S i3lock-fancy-git --noconfirm #i3lock-fancy -- scrot -z
	#trizen -S gnome-pie --noconfirm
	#trizen -S ipscan --noconfirm 
	#trizen -S tilda --noconfirm
	#trizen -S upterm --noconfirm
	#trizen -S evince --noconfirm
	#trizen -S caprine --noconfirm
	#trizen -S atom --noconfirm
	#trizen -S neovim --noconfirm
	#trizen -S mypaint --noconfirm
	#trizen -S viber --noconfirm
	#trizen -S typora --noconfirm
	#trizen -S oranchelo-icon-theme-git #oranchelo icon theme
	#trizen -S translate-shell --noconfirm #trans -T = language table / trans :en "[Enter] Meu coracao e forte!"

	
