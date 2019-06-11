#!/bin/bash
        nmap -sP $1 >/dev/null && arp -an | grep $2 | awk '{print $2}' | sed 's/[()]//g'	
