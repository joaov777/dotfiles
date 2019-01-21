#!/bin/bash

	echo '###>> RDP <<###'
	read -p '#USER:' user
	read -s -p '#PASSWORD: ' password
	echo 
	read -p '#MACHINE: ' machine
	read -p '#GRAPHICS: ' graphics

	rdesktop -u $user -p $password -g $graphics $machine
