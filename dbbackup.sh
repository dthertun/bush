#!/bin/bash
# Backup MYSQL script v.1.0

# Get today date
NOW=$(date +"%d-%m-%Y")

# Location to backup
BAK="/tmp/backup"

# Mysql Server login information
USER="root"
#PASS="*****"
#HOST="127.0.0.1"

# Mysql utilities Path
MYSQL="/usr/bin/mysql"
MYSQLDUMP="/usr/bin/mysqldump"
GZIP="/usr/bin/gzip"

# Check backup dir
if [ ! -d "$BAK" ]
then
	mkdir -p "$BAK"
fi

# Get all mysql database names
DBS="$($MYSQL -u $USER -Bse 'show databases')"

echo -n "Dumping ......"

for db in $DBS
do
	FILE="$BAK/mysql-$db.$NOW-$(date +"%T").gz"
	$MYSQLDUMP -u $USER $db | $GZIP -9 > $FILE
	echo -n "."
done

echo -n "..... Done !"
echo " "

