#!/usr/bin/bash
# info.sh
clear
echo "hello $USER"
echo -e "Today is \c "; date
echo -e "Number of user login : \c";who |wc -l
echo "Calendar"
cal
exit 0
