#!/bin/bash

	cd ~
	wget -q https://github.com/joaov777/mainconf/archive/master.zip
	sudo unzip -qq master.zip
	sudo mv mainconf-master mainconf
	sudo chmod -R 777 mainconf/
	sudo chown -R joao:joao mainconf/
	sudo rm master.zip
	rm -- "$0" 
