#!/bin/bash

dollar_rate=$(curl -s https://www.x-rates.com/table/\?from\=USD\&amount\=1 | grep ";to=BRL" | awk '{print $3}' | cut -c58-61) &> /dev/null 2>&1
	echo "> Current dollar rate: $dollar_rate"
