#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sourcing necessary packages
. "$SCRIPT_DIR"/../scripts/menus.sh
. "$SCRIPT_DIR"/../scripts/functions.sh

packages_required=(
	conf i3 xclip pdfarranger gvfs openssh w3m discord spotify-launcher postgresql gsimplecal tcpdump ntfs-3g \
	bind-tools rofi dmenu keepassxc brightnessctl pacman-contrib netctl \
	git notepadqq gparted papirus-folders-git acpi pulseaudio-alsa xfce4-notifyd \
	filezilla telegram-desktop copyq flameshot ranger pulseaudio-ctl xfce4-power-manager \
	gedit pwgen openssh vim rdesktop i3lock i3lock-fancy-git mtr tmux iw py3status tldr fzf thunar rclone \
	nmap okular viewnior ncdu inxi htop dialog polybar nordvpn-bin nitrogen \
	veracrypt papirus-icon-theme neofetch lxappearance vlc picom i3status trayer vifm exa \
	arp-scan net-tools peek xorg-server xorg-apps xorg-init networkmanager-dmenu-git \ 
	imagewriter wget dnsutils xorg-xrandr arandr sshfs nm-connection-editor  \ 
	pulseaudio-alsa pulseaudio-bluetooth bluez bluez-libs bluez-utils blueman tilix autorandr feh \
	noto-fonts ttf-ubuntu-font-family ttf-dejavu openvpn ttf-freefont ttf-liberation otf-fira-mono nerd-fonts-fira-code \
  	ttf-droid ttf-inconsolata ttf-roboto terminus-font ttf-font-awesome ttf-font-awesome-5 otf-font-awesome \
	xournalpp font-awesome ttf-unifont siji-git docker docker-compose geoclue \
	alsa-utils alsa-plugins alsa-lib redshift pavucontrol zathura zathura-pdf-mupdf xdg-utils libsecret gnome-keyring \
	visual-studio-code-bin
	)

	# yay helper needed
	if ! isPackageInstalled yay; then
		./install_yay_helper
	else
		echo "|--> Yay has already been installed!" ; sleep 3
	fi
	   
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


	papirus-folders -C white > /dev/null

	# nord related
	echo "|--> Enabling NordVPN..." && sudo systemctl enable nordvpnd --now

	# bluetooth related
	echo "|--> Enabling bluetooth..." && sudo systemctl enable bluetooth.service --now

	# docker related
	echo "|--> Setting up Docker..." && sudo usermod -aG docker $USER

	# update local crontab
	(crontab -l 2>/dev/null; echo "@reboot $HOME/dotfiles/scripts/mount-rclone-remotes.sh --mount --all >/dev/null 2>&1") | crontab -

	clear
