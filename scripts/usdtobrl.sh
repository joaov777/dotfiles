# USD TO BRL CONVERTER

#!/bin/bash
	
	dollar_rate=$(curl -s https://www.x-rates.com/table/\?from\=USD\&amount\=1 | grep ";to=BRL" | awk '{print $3}' | cut -c59-62) &> /dev/null 2>&1
	echo "> Current dollar rate: $dollar_rate"
	
	while [ true ];
	do
	
	read -p "USD : " USD_amount
		
	conversion=$(echo "${USD_amount}*${dollar_rate}" |bc -l)

	#BRL_amount=${1}

	echo "> Conversion: \$$USD_amount = R\$${conversion}"
	
	done





	
