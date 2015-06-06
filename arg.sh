#!/usr/bin/bash

e() {
	printf "\033[1;37m[[ \033[1;31m! \033[1;37m]] \033[0m$1\n"
}

a() {
	printf "\033[1;37m[ \033[1;31m* \033[1;37m] \033[0m$1\n"
}

error(){
	e "ERROR.... "
	e "please type help "
	}
help() {
	a " $0 install apache = apache ko thwin pay lame mal "
	a " $0 install mysql = mysql ko thwin pay lame mal "
	}
		if [ $1 == "install" ]
		then
			if [ $2 == "apache" ]
			then
				echo $1"ing " $2"......!"
				
			elif [ $2 == "mysql" ] 
			then
				echo $1"ing  "$2"......!"
				
			else
				error
			fi
		#elif [ $1 == "install" ]
		elif [ $1 = help ]
		then 
			help
		else
			#echo "usage : $0 install apache|mysql "
			error
		fi

