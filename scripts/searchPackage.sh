
#!/bin/bash
firstParameter=${1-text}
secondParameter=${2:-}

[ $# -eq 0 ] && { echo "Usage: sp package_name key_word" ; exit 1; }
if [[ $secondParameter != "" ]];
then
	trizen -Ss $firstParameter | grep $secondParameter	
else
	trizen -Ss $firstParameter	

fi
