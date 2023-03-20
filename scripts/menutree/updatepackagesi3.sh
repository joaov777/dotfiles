#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sourcing necessary packages
. "$SCRIPT_DIR"/../misc/menus.sh
. "$SCRIPT_DIR"/../misc/functions.sh

packages_required=(
	dconf ly i3 pdfarranger openssh w3m discord spotify-launcher tcpdump ntfs-3g tldr fzf thunar rclone \
	visual-studio-code-bin bind-tools rofi dmenu keepassxc brightnessctl netctl \
	git tilda notepadqq gparted papirus-folders-git acpi pulseaudio-alsa xfce4-notifyd \
	filezilla telegram-desktop copyq flameshot ranger pulseaudio-ctl xfce4-power-manager \
	gedit pwgen openssh vim rdesktop i3lock i3lock-fancy-git mtr tmux iw py3status \
	nmap okular viewnior ncdu inxi htop otf-fira-mono nordvpn-bin nitrogen netctl \
	veracrypt papirus-icon-theme neofetch lxappearance vlc picom i3status trayer vifm exa \
	arp-scan net-tools teamviewer peek xorg-server xorg-apps xorg-init networkmanager-dmenu-git \ 
	imagewriter wget dnsutils xorg-xrandr arandr sshfs nm-connection-editor nerd-fonts-fira-code \ 
	pulseaudio-alsa pulseaudio-bluetooth bluez bluez-libs bluez-utils blueman tilix autorandr feh \
	noto-fonts ttf-ubuntu-font-family ttf-dejavu openvpn ttf-freefont ttf-liberation dialog polybar  \
  	ttf-droid ttf-inconsolata ttf-roboto terminus-font ttf-font-awesome ttf-font-awesome-5 otf-font-awesome \
	xournalpp font-awesome ttf-unifont siji-git docker docker-compose geoclue brave rclone-browser-git \
	alsa-utils alsa-plugins alsa-lib redshift pavucontrol zathura zathura-pdf-mupdf xdg-utils libsecret gnome-keyring    
	)

	# checking yay helper installation
	[ installYayHelper ] && echo "|--> Yay successfully installed!" || echo "|--> Yay not installed!" ; sleep 3
	   
	# installing all packages
	for pkg in "${packages_required[@]}"; do
		subMenu "Dotfiles" "Update packages"

		if [ -z "$(pacman -Qi $pkg 2>/dev/null)" ]; then 
			echo "|--> Installing $pkg..." 
			yay -S "$pkg" --noconfirm --needed 
			[ isPackageInstalled "$pkg" ] && echo "|--> $pkg successfully installed!" || echo "|--> $pkg not installed!"
		else
		echo "|--> $pkg is already installed!!" > /dev/null 
		fi
	done

	#enabling sharing
	echo "|--> Enabling Samba permissions" ; 
	sudo smbpasswd -a $USER 
	papirus-folders -C white > /dev/null
	xdg-user-dirs-update

	#teamviewer related
	echo "|--> Enabling TeamViewer" ;
	sudo teamviewer --daemon enable > /dev/null
	sudo systemctl enable teamviewerd.service --now > /dev/null

	#nord related
	echo "|--> Enabling and Starting VPN service" ;
	sudo systemctl enable nordvpnd --now

	#bluetooth related
	echo "|--> Enabling bluetooth service"
	sudo systemctl enable bluetooth.service --now
	
    clear
