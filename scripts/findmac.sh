#!/bin/bash

	echo " -- MAC FOUND: "$(sudo arping -I $1 -c 1 $2 | grep 'reply from' | cut -d ' ' -f 5)	

