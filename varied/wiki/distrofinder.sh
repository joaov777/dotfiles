#!/bin/bash

	if [ -n "$(cat /etc/*-release | grep -i archlabs)" ]; then
		echo "ARCH LABS!!!"
	else
		echo "MANJARO!!!!"
	fi
