#!/bin/bash

clear
        
    echo "$(tput bold)$(tput setaf 7)"
    echo "|==============|> MAINCONF <|==============|"
    echo "|------------> INSTALL XFCE DE <------------|"
        
	while [ true ];
	do
	echo "Would you like to install the XFCE DE?"
	echo "(Y/y) - Yes"
	echo "(N/n) - No"
	read -p "Option: " option

	#echo "The option chosen was $option"
	
	case $option in
	Y|y)
		echo "Installing XFCE DE..." && sleep 1
		sudo pacman -S xfce4 xfce4-goodies xfce4-terminal --noconfirm --needed
		echo "|--> XFCE Desktop environment installed!! && sleep 2
		
		
		echo "Installing Ligthdm Login manager..." && sleep 1
		sudo pacman -S lightdm lightdm-gtk-greeter --noconfirm --needed
		sudo systemctl enable lightdm.service --now
		echo "|--> Lightdm Login manager installed!! && sleep 2
	
	;;
	N|n)
		exit
	;;
	*)
		echo "Invalid option!!" && sleep 1
		clear
	esac
	
done

clear



	