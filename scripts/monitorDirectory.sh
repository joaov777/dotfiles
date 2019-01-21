#!/bin/bash
firstParameter=${1-~}
secondParameter=$pwd

if [[ $firstParameter != "" ]];
then
	watch --interval 1 du -sh $firstParameter 
else
	watch --interval 1 du -sh $secondParameter	

fi

