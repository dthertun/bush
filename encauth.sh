#!/usr/bin/bash#
################

read -p "username :" user
read -s -p "password :" passwd

a=`echo $passwd | openssl dgst -md5 |awk '{ print $2 }'`
keyword=$a"567"

if [ $user == admin && echo $keyword == 05661a629329b9ab6b7672127bd74ecd567 ]
then
	echo "Success login...!"
else
	echo "login fail....!"
	exit
fi

echo "hello"

