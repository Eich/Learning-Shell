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
#If the network has jitter, using ping 3 times to test
IP_LIST="192.168.1.109 192.168.1.110 192.168.1.111"
for IP in $IP_LIST;do
    NUM=1
    while [ $NUM -le 3 ];do #le it means <=
        if ping -c 1 $IP &>/dev/null;then
            echo "$IP ping is Successful"
            break
        else
           # echo "$IP ping is failure"
           FINAL_COUNT[$NUM]=$IP
           let NUM++
           #echo "$FINAL_COUNT[$NUM]"
        fi
        if [ ${#FINAL_COUNT[*]} -eq 3 ];then  #use # to count the FINAL_COUNT numbery 
            echo "${FINAL_COUNT[1]} ping is failure"
            unset FINAL_COUNT[*]  #need to unset the value of array
        fi
    done
done

#the second way to test the host status
#If the network has jitter, using ping 3 times to test
IP_LIST="192.168.1.109 192.168.1.110 192.168.1.111"
for IP in $IP_LIST;do
    FINAL_COUNT=0
    for ((i=1;i<=3;i++));do #le it means <=
        if ping -c 1 $IP &>/dev/null;then
            echo "$IP ping is Successful"
            break
        else
           # echo "$IP ping is failure"
           let FINAL_COUNT++ 
           #echo "$FINAL_COUNT"
        fi
        if [ $FINAL_COUNT -eq 3 ];then 
             echo "$IP ping is failure"
        fi
    done
done
