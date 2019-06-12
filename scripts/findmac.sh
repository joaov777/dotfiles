#!/bin/bash

	#previous command
	#echo " -- MAC FOUND: "$(sudo arping -I $1 -c 1 $2 | grep 'reply from' | cut -d ' ' -f 5)	

	#echo " -- MAC FOUND: "$()echo " -- IP FOUND: "$(sudo arp-scan $1 | grep $2 | cut -f 2)


	#Correct command
	echo "-- MAC FOUND: "$(sudo arp-scan $1 | sed -n '3p' | cut -f 2,3)
	 
