#!/bin/bash

	#convert campus name to UPPERCASE
	campus=`echo "$1" | awk '{ print toupper($0) }'`

	#If the pipe is already created, it breaks it. If not created yet, it will be so and vice-versa.
	case $campus in
		PICI|REITORIA)
	
			if [ -z "$(ps aux | grep $campus.ifce.ovpn | sed '$d' | awk '{print $2}')" ]
			then
				sudo openvpn --config ~/Desktop/joao.galvino$campus.ifce.ovpn --daemon && echo "VPN $campus pipe created"
			else
				sudo kill -9 "$(ps aux | grep $campus.ifce.ovpn | sed '$d' | awk '{print $2}')" && echo "VPN $campus pipe destroyed"
			fi ;;
	
		*) echo "$(ps aux | grep $campus.ifce.ovpn | sed '$d')"
	esac


	
