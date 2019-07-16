#!/bin/bash

#Main command used for installing everything
#wget -q -O ~/trigger.sh https://bit.ly/mainconf0 ; sudo chmod 777 ~/trigger.sh ; sudo ~/trigger.sh

triggercore() {
	cd ~
	wget -q https://github.com/joaov777/mainconf/archive/master.zip
	sudo unzip -qq master.zip 
	sudo mv mainconf-master mainconf
	sudo chmod -R 777 mainconf/
	sudo chown -R $USER:$USER mainconf/
	sudo rm master.zip

	echo '>> mainconf success!' 
	sleep 2

	#calling the main script
	~/mainconf/mainconf.sh

	#deleted folder without git
	sudo rm -rf ~/mainconf

	#downloading main repo
	git clone https://github.com/joaov777/mainconf.git /home/$USER
	sudo chmod -R 777 ~/mainconf 

	rm -- "$0" #script auto delete
}


	if [ ! -d ~/mainconf ]; #in case directory doesn't exists
	then
		triggercore
	else
		echo '>> Mainconf folder exists!!'
		sleep 2
		echo '>> Deleting it!!'
		sleep 2
		sudo rm -rf ~/mainconf/ >> /dev/null
		
		echo '>> Mainconf folder deleted!!'
		sleep 2
		echo '>> Restarting script!!'
		sleep 2
		triggercore
	fi
