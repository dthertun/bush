read -p "check user in /etc/passwd : " user

grep "^$user:" /etc/passwd > /dev/null
if test $? -eq 0
then
	echo "User '$user' found in /etc/passwd"
else
	echo "User '$user' not found in /etc/passwd"
fi
