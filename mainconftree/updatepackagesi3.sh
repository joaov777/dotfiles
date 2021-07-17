#!/bin/bash

packages_required=(
	trizen i3-gaps pdfarranger openssh tcpdump tldr fzf thunar \
	visual-studio-code-bin bind-tools rofi dmenu brave keepassxc brightnessctl termite \
	git tilda notepadqq gparted papirus-folders-git netctl acpi pulseaudio-alsa xfce4-notifyd \
	filezilla telegram-desktop copyq flameshot ranger pulseaudio-ctl xfce4-power-manager\
	gedit pwgen openssh vim rdesktop i3lock i3lock-fancy-git mtr tmux iw py3status \
	nmap okular viewnior ncdu inxi htop otf-fira-mono nordvpn-bin nitrogen netctl \
	veracrypt papirus-icon-theme neofetch lxappearance vlc picom i3status trayer vifm exa \
	arp-scan net-tools teamviewer rclone peek xorg-server xorg-apps xorg-init networkmanager-dmenu-git \ 
	imagewriter albert wget dnsutils xorg-xrandr arandr sshfs nm-connection-editor nerd-fonts-fira-code \ 
	pulseaudio-alsa pulseaudio-bluetooth bluez bluez-libs bluez-utils blueman tilix autorandr feh \
	noto-fonts ttf-ubuntu-font-family ttf-dejavu openvpn ttf-freefont ttf-liberation dialog polybar  \
  ttf-droid ttf-inconsolata ttf-roboto terminus-font ttf-font-awesome xournalpp font-awesome ttf-unifont siji-git \
	alsa-utils alsa-plugins alsa-lib pavucontrol lightdm lightdm-gtk-greeter 
	)
	
check_installation() {
	if [ -z "$(pacman -Qi $1)" ]; then echo "|--> ERROR: Package $1" && sleep 1; else echo "|--> SUCCESS: Package $1" && sleep 1; fi
}
	#checking Yay AUR Helper
	if [ -z "$(pacman -Qi yay)" ]; then sudo pacman -S yay --needed --noconfirm; else echo "|--> Yay is installed" && sleep 1; fi
	   
for pkg in "${packages_required[@]}"; do
	clear
	echo "$(tput bold)$(tput setaf 7)"
	echo "|==============|> MAINCONF <|==============|"
	echo "|------------> UPDATE PACKAGES <-----------|"

	#manage installation
	if [ -z "$(pacman -Qi $pkg)" ]; then 
		echo "|--> Installing $pkg..." 
		yay -S "$pkg" --noconfirm --needed 
		check_installation "$pkg"
	else
		echo "|--> $pkg is already installed!!" > /dev/null 
	fi
done

	#for Thunar
	sudo pacman -S gvfs gvfs-smb gvfs-mtp xdg-users-dirs --noconfirm --needed
	xdg-user-dirs-update
	sudo smb passwd -a joao

	#enabling some settings for vim
	cp ~/mainconf/varied/vifm/.vimrc ~

	#installing cursor themes
	sudo cp -r ~/i3/varied/cursors/* /usr/share/icons/

	#enabling bluetooth service
	sudo systemctl enable bluetooth --now

	#installing themes
	sudo cp -r ~/i3/varied/themes/* /usr/share/themes/

	#teamviewer related
	sudo teamviewer --daemon enable
	sudo systemctl enable teamviewerd.service --now

	#tmux related
	cp ~/i3/varied/tmux/.tmux.conf ~

	#nord related
	sudo systemctl enable nordvpnd --now

	#printing related - install manually on the 'print settings' GUI
	#sudo pacman -S manjaro-printer
	#sudo gpasswd $USER sys
	#sudo systemctl enable --now org.cups.cupsd.service

	sudo papirus-folders -C black 

    clear
