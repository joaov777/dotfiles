#!/bin/bash

	


triggercore() {
		echo ">> Cloning main repo " ; sleep 1
		
		cd ~
        git clone https://github.com/joaov777/wiki.git /home/$USER/wiki
		git remote set-url git@github.com:joaov777/wiki.git
		sudo chmod -R 777 ~/wiki

        echo '>> Wiki downloaded!' 
        sleep 2
}

        if [ ! -d ~/wiki ]; #in case directory doesn't exists
        then

                triggercore
        else
                echo '>> Wiki folder exists!!'
                echo '>> Deleting it!!'

                sudo rm -rf ~/wiki >> /dev/null

                echo '>> Wiki folder deleted!!'
                echo '>> Restarting script!!'
                sleep 1

                triggercore
        fi
