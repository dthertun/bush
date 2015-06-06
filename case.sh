#!/usr/bin/bush
echo "Choose Servers"
echo "1 = Apache"
echo "2 = MySql"
read input

case $input in
1) yum install httpd -y
;;
2) yum install mariadb-server -y
;;
*) echo "error"
;;
esac 
