#!/bin/bash

	echo ">>> FIND IP ADDRESS <<<"
	read -p ">> Network/Mask:" n
	read -p ">> MAC:" m

	echo "IP found: " 
	nmap -sP $n >/dev/null && arp -an | grep $m | awk '{print $2}' | sed 's/[()]//g'
