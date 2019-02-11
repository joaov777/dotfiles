#!/bin/bash


    while [ true ];
    do

    clear
    echo "$(tput setaf 6)###### MAIN CONF #######"
    echo "#(1) - Setup GIT User"
    echo "#(2) - Install ZSH"
    echo "#(3) - Update .ZSHRC"
    echo "#(4) - Update System (Mirrors and packages)"
    echo "#(5) - Update Packages"
    echo "#(6) - Update Tilda"
    echo "#(7) - Check Installed Packages"
    echo "#(8) - Setup Plank"
    echo "#(9) - Exit"
    echo "############################"
    read -p "Option: " menuChoice


    case $menuChoice in
        1)

        ~/mainconf/mainconftree/setupgituser.sh

        #clear
        #echo '###### MAIN CONF ######'
        #echo "- OPTION 1 - SETUP GIT USER -"
        #sleep 1

	    #    sudo pacman -S trizen --noconfirm
	    #    trizen -S git --noconfirm

        #  sudo git config --global user.name "joaov777"
	    #    sudo git config --global user.email "joaov777@gmail.com"
	    #    sudo git config --global core.editor vim

        #  cd ~/
	    #   git clone git@github.com:joaov777/mainconf.git
        #   sudo chmod -R 777 ~/mainconf

        #clear

        ;;
        2)

        ~/mainconf/mainconftree/installzsh.sh

        #clear
        #echo '###### MAIN CONF ######'
        #echo "- OPTION 2 - INSTALL ZSH -"
        #read -p "Insert your username: " username

        #  trizen -S zsh --noconfirm
	    #    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	    #    sudo usermod -s /bin/zsh $username
	    #    sudo chsh -s /bin/zsh $username

        #clear

        ;;
        3)

        ~/mainconf/mainconftree/updatezshrc.sh

        #clear
        #echo '###### MAIN CONF ######'
        #echo "- OPTION 3 - UPDATE .ZSHRC -"
        #sleep 1

        #    cat ~/mainconf/zsh/.zshrc > ~/.zshrc
        #    sudo ln -sf ~/mainconf/zsh/.zshrc ~/.zshrc

        #clear

        ;;
        4)

        ~/mainconf/mainconftree/updatesystem.sh

        #clear
        #echo '###### MAIN CONF ######'
        #echo "- OPTION 4 - UPDATE SYSTEM (MIRRORS AND PACKAGES) -"
        #sleep 1

        #    sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu --noconfirm
        #    sudo pacman-optimize && sync --noconfirm
        #    sudo pacman -Syyu --noconfirm

        #clear

        ;;
        5)

        ~/mainconf/mainconftree/updatepackages.sh

        #clear
        #echo '###### MAIN CONF #######'
        #cho "- OPTION 5 - UPDATE PACKAGES -"
        #sleep 1

        #    ~/mainconf/updatePackages/updatePackages.sh

        #clear

        ;;
        6)

        ~/mainconf/mainconftree/updatetilda.sh

        #clear
        #echo '###### MAIN CONF ######'
        #echo "- OPTION 6 - UPDATE TILDA -"
        #sleep 1

        #    #creating or overwriting tilda config files for three terminals
        #    cat ~/mainconf/tilda/config_0 > ~/.config/tilda/config_0
        #    cat ~/mainconf/tilda/config_1 > ~/.config/tilda/config_1
        #    cat ~/mainconf/tilda/config_2 > ~/.config/tilda/config_2

            #creating links to the main file in configXfce3
        #    sudo ln -sf ~/mainconf/tilda/config_0 ~/.config/tilda/config_0
        #    sudo ln -sf ~/mainconf/tilda/config_1 ~/.config/tilda/config_1
        #    sudo ln -sf ~/mainconf/tilda/config_2 ~/.config/tilda/config_2

        #clear

        ;;
        7)

        ~/mainconf/mainconftree/checkinstalledpackages.sh

        ;;
	    8)

        ~/mainconf/mainconftree/setupplank.sh

        #clear
        #echo '###### MAIN CONF ######'
        #echo "- OPTION 8 - SETUP PLANK -"

        #     echo "> Installing themes..."
        #     sudo cp -R ~/mainconf/plank/themes/* ~/.local/share/plank/themes/.

        #     sleep 2

        #     echo "> Enabling launchers..."
        #     sudo cp ~/mainconf/plank/launchers/* ~/.config/plank/dock1/launchers/.

        #     echo "> SUCCESS!! - Plank Themes and launchers correctly enabled!!"
	          

        #    sleep 3

        #clear

        ;;
        9)

        clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 9 - EXIT -"

            echo '> Exiting...'
            sleep 1
            clear
            exit

        ;;
        *)

        clear
        echo '###### MAIN CONF ######'
        echo "> INVALID OPTION <"
        sleep 1
        clear

        ;;
    esac

    done
