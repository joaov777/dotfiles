#!/bin/bash

	cd ~
	wget https://bit.ly/mainconf777 #wget https://github.com/joaov777/mainconf/archive/master.zip
	sudo mv mainconf777 mainconf.zip
	sudo unzip mainconf.zip
	sudo mv mainconf-master mainconf
	sudo chmod -R 777 mainconf/
	sudo rm mainconf.zip
