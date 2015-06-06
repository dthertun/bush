#!/bin/bash

cred=`zenity --username --password`

user=`echo $cred|cut -d'|' -f1`
pass=`echo $cred|cut -d'|' -f2`

if [ $user = "admin" ]
then 
	if [ `echo $pass|openssl dgst -md5|awk '{ print $2 }'` = "483527c400a6242c5150f45e39e8248b" ]
	then
		zenity --info --text="Welcome $user"
	else
		zenity --error --text="login Fail!"
		exit
	fi
else
	zenity --error --text="login Fail!"
 	exit
fi
