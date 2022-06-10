#!/bin/bash
. ~/dotfiles/scripts/misc/menus.sh

packages_required=(
	ly i3 pdfarranger openssh tcpdump tldr fzf thunar termite rclone \
	visual-studio-code-bin bind-tools rofi dmenu brave keepassxc brightnessctl netctl \
	git tilda notepadqq gparted papirus-folders-git acpi pulseaudio-alsa xfce4-notifyd \
	filezilla telegram-desktop copyq flameshot ranger pulseaudio-ctl xfce4-power-manager\
	gedit pwgen openssh vim rdesktop i3lock i3lock-fancy-git mtr tmux iw py3status \
	nmap okular viewnior ncdu inxi htop otf-fira-mono nordvpn-bin nitrogen netctl \
	veracrypt papirus-icon-theme neofetch lxappearance vlc picom i3status trayer vifm exa \
	arp-scan net-tools teamviewer peek xorg-server xorg-apps xorg-init networkmanager-dmenu-git \ 
	imagewriter wget dnsutils xorg-xrandr arandr sshfs nm-connection-editor nerd-fonts-fira-code \ 
	pulseaudio-alsa pulseaudio-bluetooth bluez bluez-libs bluez-utils blueman tilix autorandr feh \
	noto-fonts ttf-ubuntu-font-family ttf-dejavu openvpn ttf-freefont ttf-liberation dialog polybar  \
  	ttf-droid ttf-inconsolata ttf-roboto terminus-font ttf-font-awesome ttf-font-awesome-5 otf-font-awesome \
	xournalpp font-awesome ttf-unifont siji-git \
	alsa-utils alsa-plugins alsa-lib pavucontrol zathura zathura-pdf-mupdf xdg-utils libsecret gnome-keyring    
	)

# check if package installed (success or fail)
function check_installation() {
	if [ -z "$(pacman -Qi $1)" ]; then echo "|--> ERROR: Package $1" && sleep 1; else echo "|--> SUCCESS: Package $1" && sleep 1; fi
}
	
# checking Yay AUR Helper
function install_yay(){
		git clone --quiet https://aur.archlinux.org/yay.git ~
		cd ~/yay
		makepkg -si
		sudo rm -rf yay
}

	# making sure yay is installed
	install_yay
	   
	# installing all packages
	for pkg in "${packages_required[@]}"; do
		subMenu "Dotfiles" "Update packages"

		if [ -z "$(pacman -Qi $pkg)" ]; then 
			echo "|--> Installing $pkg..." 
			yay -S "$pkg" --noconfirm --needed 
			check_installation "$pkg"
		else
		echo "|--> $pkg is already installed!!" > /dev/null 
		fi
	done

	#enabling sharing
	echo "|--> Enabling Samba permissions" ; 
	sudo smbpasswd -a $USER 
	papirus-folders -C white > /dev/null
	xdg-user-dirs-update

	#enabling some settings for vim
	cp ~/mainconf/varied/vifm/.vimrc ~

	#installing cursor themes
	echo "|--> Installing Cursor Themes" ; 
	sudo cp -r ~/dotfiles/config/cursors/* /usr/share/icons/

	#installing themes
	echo "|--> Installing Themes" ; 
	sudo cp -r ~/dotfiles/config/themes/* /usr/share/themes/

	#teamviewer related
	echo "|--> Enabling TeamViewer" ; 
	sudo teamviewer --daemon enable > /dev/null
	sudo systemctl enable teamviewerd.service --now > /dev/null

	#tmux related
	echo "|--> Setting up TMUX" ; 
	cp ~/dotfiles/config/tmux/.tmux.conf ~
	
	#notepadqq
	echo "|--> Setting up Notepadqq" ; 
	notepadqq=~/.config/Notepadqq
    [ -f $notepadqq/Notepadqq.ini ] && rm $notepadqq/Notepadqq.ini || mkdir -p $notepadqq
    cp ~/dotfiles/config/notepadqq/Notepadqq.ini $notepadqq && ln -sf ~/dotfiles/config/notepadqq/Notepadqq.ini $notepadqq

	#tilix
	echo "|--> Setting up Tilix" ; 
	dconf load /com/gexperts/Tilix/ < ~/dotfiles/config/tilix/tilix.dconf

	#albert
	echo "|--> Setting up Albert" ; 
	[ -f ~/.config/albert/albert.conf ] && rm ~/.config/albert/albert.conf 
	cp ~/dotfiles/config/albert/albert.conf ~/.config/albert
	pkill /usr/bin/albert > /dev/null

	#nord related
	echo "|--> Enabling and Starting VPN service" ; 
	sudo systemctl enable nordvpnd --now
	
    clear
