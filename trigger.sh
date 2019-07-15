#!/bin/bash

triggercore() {
	cd ~
	wget -q https://github.com/joaov777/mainconf/archive/master.zip
	sudo unzip -qq master.zip
	sudo mv mainconf-master mainconf
	sudo chmod -R 777 mainconf/
	sudo chown -R joao:joao mainconf/
	sudo rm master.zip
	rm -- "$0" 
}


	if [ ! -d ~/mainconf ]; 
	then
		triggercore
	else
		echo ">> Mainconf folder exists!!"
		sleep 1
		echo ">> Deleting it!!"
		sleep 1
		sudo rm -rf ~/mainconf/ >> /dev/null
		
		echo ">> Mainconf folder deleted!!"
		sleep 1
		echo ">> Restarting script!!"
		sleep 1
		triggercore
	fi
