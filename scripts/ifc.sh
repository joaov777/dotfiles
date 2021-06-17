#!/bin/bash

	#ovpn keys directory - CHANGE WHEN NECESSARY
	directory="/home/$USER/Documents/IFCERelated/VPN/"

	#convert campus name to UPPERCASE
	campus=`echo "$1" | awk '{ print toupper($0) }'`
	
	#list of openvpn PID's
	openvpnpid="$(ps aux | grep $campus.ifce.ovpn | sed '$d' | awk '{print $2}')"

	#If the pipe is already created, it breaks it. If not created yet, it will be so and vice-versa.
	case $campus in
		PICI|REITORIA)
	
			if [ -z "$(ps aux | grep $campus.ifce.ovpn | sed '$d' | awk '{print $2}')" ]
			then
				sudo openvpn --config "$directory"joao.galvino"$campus".ifce.ovpn --daemon && echo "VPN $campus pipe created"
			else
				sudo kill -9 "$(ps aux | grep "$campus".ifce.ovpn | sed '$d' | awk '{print $2}')" && echo "VPN $campus pipe destroyed"
			fi ;;
		
		d|D|destroy|d|D|DESTROY)
			if [ -z "$openvpnpid" ]
			then
				sudo killall openvpn && echo "No pipe established"
			fi ;;
	
		*) 
			if [ -z "$openvpnpid" ]
			then
				echo "No pipe established"
			else
				ps aux | grep $campus.ifce.ovpn | sed '$d'
			fi
				
	esac


	
