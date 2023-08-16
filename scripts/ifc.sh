#!/bin/bash

	#ovpn keys directory - CHANGE WHEN NECESSARY
	directory="/home/$USER/Documents/IFCERelated/VPN/"

	#convert campus name to UPPERCASE
	campus=`echo "$1" | awk '{ print toupper($0) }'`
	
	#list of openvpn PID's
	openvpnpid="$(ps aux | grep $campus.ifce.ovpn | sed '$d' | awk '{print $2}')"

	#If the pipe is already created, it breaks it. If not created yet, it will be so and vice-versa.
	case "$campus" in
		PICI|REITORIA)
	
			if [ -z "$openvpnpid" ]
			then
				sudo openvpn --config "$directory"joao.galvino"$campus".ifce.ovpn --daemon && echo "> VPN $campus connected"
			else
				sudo kill -9 "$(ps aux | grep "$campus".ifce.ovpn | sed '$d' | awk '{print $2}')" && echo "> VPN $campus disconnected"
			fi ;;
		
		d|D)
			if [ -z "$openvpnpid" ]
			then
				sudo killall openvpn && echo "> No connections"
			fi ;;
	
		*) 
			if [ -z "$openvpnpid" ]
			then
				echo "> No connections"
			else
				ps aux | grep $campus.ifce.ovpn | sed '$d'
			fi ;;
				
	esac

	