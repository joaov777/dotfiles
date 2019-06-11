#!/bin/bash

	nmcli dev wifi hotspot ifname $1 ssid $2 password "$3"
