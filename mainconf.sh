#!/bin/bash


    while [ true ];
    do

    clear
    echo "$(tput setaf 6)###### MAIN CONF #######"
    echo "#(1) - Setup GIT User"
    echo "#(2) - Install ZSH"
    echo "#(3) - Update .ZSHRC"
    echo "#(4) - System Update"
    echo "#(5) - Update Packages"
    echo "#(6) - Update Tilda"
    echo "#(7) - Installed Packages"
    echo "#(8) - Exit"
    echo "############################"
    read -p "Option: " menuChoice


    case $menuChoice in
        1)

        clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 1 - SETUP GIT USER -"
        sleep 1

            #yes | sudo pacman -S git
	      sudo pacman -S trizen --noconfirm
	      trizen -S git --noconfirm

            sudo git config --global user.name "joaov777"
	        sudo git config --global user.email "joaov777@gmail.com"
	        sudo git config --global core.editor vim

            cd ~/
	        git clone git@github.com:joaov777/mainconf.git
            sudo chmod -R 777 ~/mainconf

        clear

        ;;
        2)

        clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 2 - SETUP ZSH -"
        read -p "Insert your username: " username

            trizen -S zsh --noconfirm
	        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	        sudo usermod -s /bin/zsh $username
	        sudo chsh -s /bin/zsh $username

        clear

        ;;
        3)

        clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 2 - UPDATE .ZSHRC -"
        sleep 1

            cat ~/mainconf/zsh/.zshrc > ~/.zshrc
            sudo ln -sf ~/mainconf/zsh/.zshrc ~/.zshrc

            #sudo rm ~/.zshrc
	        #cp ~/configXfce3/zsh/.zshrc ~/
	        #creating a link on the target folder (~/.zshrc) pointing to the real file at ~/configXfce2/zsh/.zshrc
	        #sudo ln -sf ~/configXfce3/zsh/.zshrc ~/.zshrc

        clear

        ;;
        4)

        clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 3 - SYSTEM UPDATE -"
        sleep 1

            sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu --noconfirm
            sudo pacman-optimize && sync --noconfirm
            sudo pacman -Syyu --noconfirm

        clear

        ;;
        5)

        clear
        echo '###### MAIN CONF #######'
        echo "- OPTION 4 - UPDATE PACKAGES -"
        sleep 1

            ~/mainconf/updatePackages/updatePackages.sh

            #cd ~/configXfce3/updatePackages
            #./updatePackages.sh

        clear

        ;;
        6)

        clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 5 - UPDATE TILDA -"
        sleep 1

            #creating or overwriting tilda config files for three terminals
            cat ~/mainconf/tilda/config_0 > ~/.config/tilda/config_0
            cat ~/mainconf/tilda/config_1 > ~/.config/tilda/config_1
            cat ~/mainconf/tilda/config_2 > ~/.config/tilda/config_2

            #creating links to the main file in configXfce3
            sudo ln -sf ~/mainconf/tilda/config_0 ~/.config/tilda/config_0
            sudo ln -sf ~/mainconf/tilda/config_1 ~/.config/tilda/config_1
            sudo ln -sf ~/mainconf/tilda/config_2 ~/.config/tilda/config_2

        clear

        ;;
        7)

        clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 6 - INSTALLED PACKAGES -"

	          read -p "> Package name: " packageName
	          echo "> Packages found: "
	          pacman -Q | grep $packageName

            sleep 5

        clear

        ;;
	    8)

        clear
        echo '###### MAIN CONF ######'
        echo "- OPTION 7 - EXIT -"

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
