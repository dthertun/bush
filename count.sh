#!/bin/bash

count=0

while true
do
	if [ $count -lt 10 ]
	then
		count=`expr $count + 1`
		echo "count $count"
		sleep 1
	else
		exit
	fi
done
	
