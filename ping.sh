#!/bin/bash
#check the host status by ping.
#The simplest example
IP_LIST="192.168.1.109 192.168.1.110"
for IP in $IP_LIST;do
    if ping -c 1 $IP &>/dev/null;then
    echo "$IP ping is Successful"
    else
    echo "$IP ping is failure"
    fi
done
