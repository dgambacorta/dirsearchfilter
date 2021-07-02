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
i=0
previousFile=''
previousSize=''
current_time=$(date "+%Y%m%d%H%M%S")
fileNameOutput=$current_time."_output"

while IFS= read -r line
do
	arr=($line)

	#check if it is the first line of the file
	if [[ "$previousFile" != "" ]]
	then
	
		if [[ "$previousFile" == "${arr[0]}" ]]
		then
			if [[ "$previousSize" != "${arr[1]}" ]]
			then
				if [[ "${arr[1]}" == *"KB"* ]]  || [[ "${arr[1]}" == *"MB"* ]]		 || [[ "${arr[1]}" == *"GB"* ]]					
				then
					if [[ "${arr[2]}" != *"index.php"* ]] && [[ "${arr[2]}" != *"favicon"* ]] && [[ "${arr[2]}" != *"crossdomain.xml"* ]] && [[ "${arr[2]}" != *"apostas.betfair.com"* ]] && [[ "${arr[2]}" != *"nintendo.com.au"* ]]	 	
					then
						echo ${arr[2]} >> $fileNameOutput
					fi
				fi
			fi
		fi

	fi

	if [[ "$previousFile" == "" ]]
	then	
	    echo ${arr[2]} > $fileNameOutput
	fi

	previousFile=${arr[0]}	
	previousSize=${arr[1]}   

	i=$((i+1))
done < "$filename"

echo "Output at: "$fileNameOutput
subl $fileNameOutput


