#!/usr/bin/bash

while true
	do
		echo "1.calendar"
		echo "2.date"
		echo "3.up time"
		read -p "Please Choose : " input
	case $input in
		1) echo "Calendar"
		   cal
		;;
		2) echo "Date"
		   date
		;;
		3) echo "Up Time"
		   uptime	
		;;
		*) echo "ERROR !"
		;;
	esac
done
