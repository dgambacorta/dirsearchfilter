#!/bin/bash

#Colors
export red=`tput setaf 1`
export green=`tput setaf 2`
export yellow=`tput setaf 3`
export cyan=`tput setaf 6`
export reset=`tput sgr0`
export bg=`tput setab 7`

#Input
echo "${green} Enter filename"
read filename
echo "${green} Complete file? 1->yes, 2->no"
read complete
echo "${green} Not complete file, amount of windows"
read amount
echo "${green} Not complete file, sleep time in sec"
read sleep
$cant=0

#Variables

export filename=${filename}
export complete=${complete}
export amount=${amount}
export sleep=${sleep}


if [ $complete = 1 ]

then

	while IFS= read -r line
	do
	  /usr/bin/firefox --new-tab "${line}" 
	done < "$filename"

fi

if [ $complete = 2 ]

then

	while IFS= read -r line		
	do
		echo $cant

		if [[ "$amount" == "$cant"  ]]
		then
			sleep $sleep
			cant=0			
		fi

    /usr/bin/firefox --new-tab "${line}" 
	cant=$((cant+1))
	done < "$filename"
	
fi