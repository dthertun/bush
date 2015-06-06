function banner(){
echo -e "\033[01;31m===================================================================="
echo -e "|     \033[01;32mBanner\033[01;31m          ______         \033[01;32mCR34T3D  BY:\033[01;31m                  |"
echo "|                    .-.      .-.                                  |"
echo "|                   /            \                                 |"
echo -e "|                  | [\033[01;32m N37S0u1 \033[01;31m] |                                 |"
echo "|                  |,  .-.  .-.  ,|                                |"
echo "|                  | )(|_/  \|_)( |                                |"
echo "|                  |/     /\     \|                                |"
echo "|          _       (_     ^^     _)                                |"
echo "|  _\ ____) \_______\__|IIIIII|__/_______________________________  |"    
echo "| (_)[___]{}<________|-\IIIIII/-|________________________________/ |"  
echo "|   /     )_/        \          /                                  |"
echo "|                     \ ______ /                                   |"
echo -e "====================================================================\033[01;37m"
echo
}

banner

check_root(){
	if [ $UID -eq 0 ]
	then 
		echo "Root user check = ok"
	else
		echo "This script can ba ran root user"
		exit
	fi
}

sys_info(){ 
	if [ `cat /etc/redhat-release | awk '{ print $1}'` = "Fedora" ] 
	then
		echo "Hostname     = $(hostname)"
		echo "OS           = $(cat /etc/redhat-release | awk '{ print $1}')"
		echo "architecture = $(arch)"
	else
		echo "This OS is not Fedora"
	fi
	
}

check_root
sys_info

about(){
	echo "This shell is bush shell v.1.0"
}
helpp(){
	echo "Type help "
}

while true
do
	echo -n "BUSH# " & read cmd
	case $cmd in
		about) about
		;;
		help) helpp
		;;
		*) eval $cmd
		;;
	esac
done
