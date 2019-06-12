#!/bin/bash
        
	#previous commmand used
	#echo " -- IP FOUND: "$(nmap -sP $1 >/dev/null && arp -an | grep $2 | awk '{print $2}' | sed 's/[()]//g')
	
	#usage findip 192.168.0.0/24 85:78:r5
        echo " -- IP FOUND: "$(sudo arp-scan $1 | grep $2 | cut -f 1)

