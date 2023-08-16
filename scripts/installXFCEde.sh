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
	Y|y|Yes|YES|yes)
		echo "Installing XFCE DE..." && sleep 1
		sudo pacman -S xfce4 xfce4-goodies xfce4-terminal --noconfirm --needed
		echo "|--> Done" && sleep 1
		
		
		echo "Installing Ligthdm Login manager..." && sleep 1
		sudo pacman -S lightdm lightdm-gtk-greeter --noconfirm --needed
		sudo systemctl enable lightdm.service --now
		echo "|--> Done" && sleep 1
	
	;;
	N|n|NO|No|no)
		exit
	;;
	*)
		echo "Invalid option!!" && sleep 1
		clear
	esac
	
done

clear



	