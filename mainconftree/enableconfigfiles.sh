#!/bin/bash

clear
        
		echo "$(tput bold)$(tput setaf 7)"
        echo "|==============|> i3 <|==============|"
        echo "|--------------> ENABLING CONFIG FILES <-------------|"
		sleep 1
		
		#~/mainconf/varied/i3related/

	    sudo mkdir -p ~/.config/copyq && 
        sudo ln -sf ~/mainconf/varied/i3related/copyq/copyq.conf ~/.config/copyq/copyq.conf &&
        echo "|--> CopyQ enabled..." ; sleep 1

        sudo mkdir -p ~/.config/Dharkael && 
        sudo ln -sf ~/mainconf/varied/i3related/flameshot/flameshot.ini ~/.config/Dharkael/flameshot.ini && 
        echo "|--> Flameshot enabled..." ; sleep 1

        sudo mkdir -p ~/.config/vifm/colors && 
        sudo ln -sf ~/mainconf/varied/vifm/themes ~/.config/vifm/colors &&
        sudo ln -sf ~/mainconf/varied/vifm/vifmrc ~/.config/vifm &&
        echo "|--> Vifm enabled..." ; sleep 1

        sudo mkdir -p /etc/xdg && 
        sudo ln -sf ~/mainconf/varied/i3related/picom/picom.conf /etc/xdg/picom.conf &&
        echo "|--> Picom compositor enabled..." ; sleep 1

        #sudo ln -sf ~/mainconf/varied/i3related/py3status/py3statusbars/i3status.conf /etc/i3status.conf &&
        #sudo ln -sf ~/mainconf/varied/i3related/py3status/py3statusbars/i3status2.conf /etc/i3status2.conf &&
        #echo "|--> Py3status bars enabled..." ; sleep 1

	sudo mkdir -p ~/.config/autorandr &&
	cp ~/mainconf/varied/monitors/autorandr/* ~/.config/autorandr/ &&
	echo "|--> Autorandr profiles loaded..." ; sleep 1
	
	git clone --quiet https://github.com/joaov777/wallpapers.git ~/Pictures/wallpapers/
	echo "|--> Wallpapers downloaded..." ; sleep 1

	sudo mkdir -p ~/.config/polybar &&
	sudo ln -sf ~/mainconf/varied/i3related/polybar/config ~/.config/polybar
	echo '|--> Polybar enabled...' ; sleep 1

        dconf load /com/gexperts/Tilix/ < ~/mainconf/varied/tilix/palenight.dconf &&
        echo "|--> Tilix enabled..." ; sleep 1

        sudo mkdir -p ~/.config/rofi &&
        sudo ln -sf ~/mainconf/varied/i3related/rofi/config ~/.config/rofi/config &&
        echo "|--> Rofi launcher enabled..." ; sleep 1

        sudo mkdir -p ~/.config/zathura &&
        sudo ln -sf ~/mainconf/varied/i3related/zathura/zathurarc ~/.config/zathura/zathurarc &&
        echo "|--> Zathura enabled..." ; sleep 1

        sudo mkdir -p /etc/X11/xorg.conf.d &&
        sudo ln -sf ~/mainconf/varied/i3related/EnableTapToClick_touchpad/90-touchpad.conf /etc/X11/xorg.conf.d/90-touchpad.conf &&
        echo "|--> Tap to click enabled..." ; sleep 1
        
        sudo mkdir -p /etc/bluetooth && 
        sudo ln -sf ~/mainconf/varied/i3related/bluetooth/main.conf /etc/bluetooth/main.conf &&
        echo "|--> Bluetooth enabled..." ; sleep 1
		
        sudo mkdir -p ~/.config/i3 && 
        sudo ln -sf ~/mainconf/varied/i3related/i3config/config ~/.config/i3/config &&
        echo "|--> i3 config enabled..." ; sleep 1
