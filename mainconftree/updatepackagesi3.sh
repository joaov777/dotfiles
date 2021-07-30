#!/bin/bash

#Including menus file
installpath=~/mainconf/scripts/
. $installpath/menus.sh

#list of available packages
available_packages=(
    trizen ly i3-gaps pdfarranger openssh tcpdump tldr fzf thunar termite rclone \
	visual-studio-code-bin bind-tools rofi dmenu brave keepassxc brightnessctl netctl \
	git tilda notepadqq gparted papirus-folders-git acpi pulseaudio-alsa xfce4-notifyd \
	filezilla telegram-desktop copyq flameshot ranger pulseaudio-ctl xfce4-power-manager\
	gedit pwgen openssh vim rdesktop i3lock i3lock-fancy-git mtr tmux iw py3status \
	nmap okular viewnior ncdu inxi htop otf-fira-mono nordvpn-bin nitrogen netctl \
	veracrypt papirus-icon-theme neofetch lxappearance vlc picom i3status trayer vifm exa \
	arp-scan net-tools teamviewer peek xorg-server xorg-apps xorg-init networkmanager-dmenu-git \ 
	imagewriter albert wget dnsutils xorg-xrandr arandr sshfs nm-connection-editor nerd-fonts-fira-code \ 
	pulseaudio-alsa pulseaudio-bluetooth bluez bluez-libs bluez-utils blueman tilix autorandr feh \
	noto-fonts ttf-ubuntu-font-family ttf-dejavu openvpn ttf-freefont ttf-liberation dialog polybar  \
  	ttf-droid ttf-inconsolata ttf-roboto terminus-font ttf-font-awesome xournalpp font-awesome ttf-unifont siji-git \
	alsa-utils alsa-plugins alsa-lib pavucontrol zathura zathura-pdf-mupdf 
)

#FUNCTION - display available packages
function showAvailablePackages() {
    counter=0

    for i in "${!available_packages[@]}"; do 
        
        #display package and its equivalent number 
        echo -n "${i}. ${available_packages[i]}  "

        #print 10 packages per line
        [ "$counter" == 9 ] && {
            echo && counter=0
        } || {
            counter=$((counter+1))
        }
    done
            echo ""
}

#FUNCTION isInstalled - Check whether a package is installed or not
function isInstalled() {
    [ ! -z "$package" ] && {
        echo "|--> Package $package installed!" && sleep 2
    } || {
        echo "|--> Package $package not installed!" && sleep 2
    }
}

#FUNCTION checkYay - Checks if helper Yay is installed
function checkYay() {
	[ -z $(pacman -Qi yay) ] && {
		echo "|--> Installling Yay AUR Helper..."
		
		#creates the temporary directory
		mkdir -p ~/yay && 

		#clones yay helper
		git clone https://aur.archlinux.org/yay.git ~/yay --quiet && 

		#installs helper silently
		cd ~/yay && makepkg -si && 

		#feedback for user
		echo "|--> Yay installed" && sleep 1 
	}

	#removing temporary yay folder
	[ -d ~/yay ] && rm -rf ~/yay 
}

#FUNCTION installPackages - Install or uninstall chosen packages
function installPackages() {

	subMenu "MAINCONF - i3" "Update Packages"
    showAvailablePackages

	#save the chosen packages as arguments into an array
    read -p "Packages: " -a chosen_packages 

    for pkg in "${!chosen_packages[@]}"; do
        package="${available_packages[${chosen_packages[$pkg]}]}" 
		yay -S "$package" --noconfirm --needed &> /dev/null
        isInstalled
    done
}
	checkYay
	installPackages 

	#for Thunar
	sudo pacman -S gvfs gvfs-smb gvfs-mtp --noconfirm --needed &> /dev/null
	#sudo smb passwd -a joao

	#enabling some settings for vim
	cp ~/mainconf/varied/vifm/.vimrc /home/$USER

	#installing cursor themes
	sudo cp -r ~/mainconf/varied/cursors/* /usr/share/icons/

	#enabling bluetooth service
	sudo systemctl enable bluetooth --now

	#installing themes
	sudo cp -r ~/mainconf/varied/themes/* /usr/share/themes/

	#teamviewer related
	sudo teamviewer --daemon enable &> /dev/null
	sudo systemctl enable teamviewerd.service 
	sudo systemctl start teamviewerd.service 

	#tmux related
	cp ~/mainconf/varied/tmux/.tmux.conf ~

	#nord related
	sudo systemctl enable nordvpnd --now

	#printing related - install manually on the 'print settings' GUI
	#sudo pacman -S manjaro-printer
	#sudo gpasswd $USER sys
	#sudo systemctl enable --now org.cups.cupsd.service

	sudo papirus-folders -C black &> /dev/null

    clear
