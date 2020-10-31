# BRL TO USD CONVERTER


#!/bin/bash

	dollar_rate=$(curl -s https://www.x-rates.com/table/\?from\=USD\&amount\=1 | grep ";to=BRL" | awk '{print $3}' | cut -c59-62) &> /dev/null 2>&1
	echo "> Current dollar rate: $dollar_rate"

	while [ true ];
	do
	
	read -p "BRL : " BRL_amount
	
	conversion=$(echo "${BRL_amount}/${dollar_rate}" |bc -l)

	#BRL_amount=${1}

	echo "> Conversion: R\$$BRL_amount = \$${conversion}"
	
	done
	


	

