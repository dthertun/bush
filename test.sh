#!/bin/bash                 #
#                           #
#############################

itfstatus(){
ip -o link show | awk '{print $2,$9}'
echo "########################"
nmcli d
}

ipstatus(){
echo "`ifconfig | grep flags | head --lines=1 | awk '{print $1}'` `ifconfig | grep inet | grep netmask | head --lines=1 | awk '{print $2}'` subnet: `ifconfig | grep inet | grep netmask | head --lines=1 | awk '{print $4}'` brocast: `ifconfig | grep inet | grep netmask | head --lines=1 | awk '{print $6}'` "
echo "`ifconfig | grep flags | head --lines=2 | tail -n 1 | awk '{print $1}'` `ifconfig | grep inet | grep netmask | head --lines=2 | tail -n 1 | awk '{print $2}'` subnet: `ifconfig | grep inet | grep netmask | head --lines=2 | tail -n 1 | awk '{print $4}'` brocast: `ifconfig | grep inet | grep netmask | head --lines=2 | tail -n 1 | awk '{print $6}'` "
echo "`ifconfig | grep flags | tail -n 1 | awk '{print $1}'` `ifconfig | grep inet | grep netmask | tail -n 1 | awk '{print $2}'` subnet: `ifconfig | grep inet | grep netmask | tail -n 1 | awk '{print $4}'` brocast: `ifconfig | grep netmask | tail -n 1 | awk '{print $6}'`"
}

itfstatus

ipstatus
