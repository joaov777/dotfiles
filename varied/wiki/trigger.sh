#!/bin/bash



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

	/home/$USER/mainconf/mainconf.sh #calling the main script as current $USER - -
	sudo rm -rf ~/mainconf #deleted folder without git - 

	clonerepo

	killthread
}

killthread() {
	rm -- "$0" #script auto delete
}

clonerepo() {

	clear
	echo ">> Cloning main repo " ; sleep 3

	#downloading main repo to current $USER
	git clone https://github.com/joaov777/mainconf.git /home/$USER/mainconf/
	chmod -R 777 ~/mainconf 
}

#Main command used for installing everything
#wget -q -O ~/trigger.sh https://rebrand.ly/triggersh ; sudo chmod 777 ~/trigger.sh ; ~/trigger.sh
#git clone https://github.com/joaov777/mainconf.git ~/mainconf ; ~/mainconf/mainconf.sh


	if [ ! -d ~/mainconf ]; #in case directory doesn't exists
	then
		
		triggercore
	else
		echo '>> Mainconf folder exists!!'
		echo '>> Deleting it!!'

		sudo rm -rf ~/mainconf/ >> /dev/null
		
		echo '>> Mainconf folder deleted!!'
		echo '>> Restarting script!!'
		sleep 1
		
		triggercore
	fi