#!/bin/bash

	read -p 'Insert comment:' comment
	
	localDirectory=$pwd
	#cd ~/configXfce2
	
	cd $localDirectory

	sudo git add .
	sudo git commit -m "$comment"
	sudo git push -u origin master
