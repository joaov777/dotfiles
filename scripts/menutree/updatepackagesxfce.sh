#!/bin/bash

# returning current directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sourcing necessary packages
. "$SCRIPT_DIR"/../misc/menus.sh
. "$SCRIPT_DIR"/../misc/functions.sh

packages_required=(
	yay keepassxc pdfarranger openssh tcpdump tldr fzf \
	visual-studio-code-bin bind-tools brave exa nerd-fonts-fira-code \
	git tilda notepadqq gparted papirus-folders-git woeusb \
	filezilla tilix telegram-desktop copyq flameshot ranger \
	gedit openvpn pwgen vim rdesktop i3lock mtr tmux font-manager unison ttf-windows \
	nmap okular viewnior ncdu inxi otf-fira-mono nordvpn-bin \
	veracrypt papirus-icon-theme neofetch xournalpp dialog \
	arp-scan net-tools teamviewer rclone peek krdc gvfs-smb thunar-shares-plugin-gtk3 gvfs 
	imagewriter albert wget dnsutils  
	)

function check_installation() {
	if [ -z "$(pacman -Qi $1)" ]; then echo "|--> ERROR: Package $1" && sleep 1; else echo "|--> SUCCESS: Package $1" && sleep 1; fi
}
	
#checking Yay AUR Helper
function check_yay(){
		git clone --quiet https://aur.archlinux.org/yay.git /opt
		cd /opt/yay
		makepkg -si
		#sudo rm -rf yay
}
	check_yay
	   
for pkg in "${packages_required[@]}"; do
	subMenu "Dotfiles" "Update Packages"

	#manage installation
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
	cp ~/dotfiles/vifm/.vimrc ~

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
	dconf load /com/gexperts/Tilix/ < ~/mainconf/varied/tilix/tilix.dconf

	#albert
	echo "|--> Setting up Albert" ; 
	[ -f ~/.config/albert/albert.conf ] && rm ~/.config/albert/albert.conf 
	cp ~/dotfiles/config/albert/albert.conf ~/.config/albert
	pkill /usr/bin/albert > /dev/null

	#nord related
	echo "|--> Enabling and Starting VPN service" ; 
	sudo systemctl enable nordvpnd --now
	
    clear
