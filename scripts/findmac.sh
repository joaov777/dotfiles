#!/bin/bash

	echo ">>>> FIND MAC ADDRESS <<<<"
	read -p "IP: " ip
	read -p "Interface: " i
	
	
	echo ">> The MAC found is: "
	sudo arping -I $i -c 1 $ip
