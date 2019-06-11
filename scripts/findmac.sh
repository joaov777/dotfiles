#!/bin/bash

	echo ">>>> FIND MAC ADDRESS <<<<"
	read -p "IP: " ip
	read -p "Interface: " i
	

	res=$(sudo arping -I $i -c 1 $ip | grep 'reply from' | cut -d ' ' -f 5)	

	echo ">> The MAC found is: $res"
