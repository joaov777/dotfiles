# BRL TO USD CONVERTER


#!/bin/bash

	dollar_rate=$(curl -s https://www.x-rates.com/table/\?from\=USD\&amount\=1 | grep ";to=BRL" | awk '{print $3}' | cut -c59-62) &> /dev/null 2>&1
	conversion=$(echo "$1 / $dollar_rate" | bc -l) && echo "|--> Conversion: R\$$1 = \$$conversion"
	



	

