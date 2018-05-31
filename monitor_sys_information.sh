#!/bin/bash
cpu(){
   local user system idle cwait
   user=$(vmstat | awk 'NR==3{print $13}')
   system=$(vmstat | awk 'NR==3{print $14}')
   idle=$(vmstat | awk 'NR==3{print $15}')
   cwait=$(vmstat | awk 'NR==3{print $16}')
   echo "CPU usage:$user%"
   echo "SYSTEM usage:$system%"
   echo "CPU-Idle usage:$idle%"
   echo "CPU-Wait usage:$cwait%"
}

memory(){
   local total used free
   used=$(free -m | awk 'NR==3{print $3}')
   free=$(free -m | awk 'NR==3{print $4}')
   total=$(($used+$free))
   echo "Memory total:${total}M"
   echo "Memory usage:${used}M"
   echo "Memory free:${free}M"
}
#if the disk used_percentage over 25 will echo data.
disk(){
    local mount total used free used_percentage 
       part=$(df -h | awk 'BEGIN{OFS="="}/^\/dev/{print $6,$2,$3,$4,int($5)}')
       for p in $part;do
         mount=$(echo $p | cut -d "=" -f1)
         total=$(echo $p | cut -d "=" -f2)
         used=$(echo $p | cut -d "=" -f3)
         free=$(echo $p | cut -d "=" -f4)
         used_percentage=$(echo $p | cut -d "=" -f5)
         if [ $used_percentage -ge 25 ];then
             echo "mount:$mount"
             echo "total:$total"
             echo "used:$used"
             echo "free:$free"
             echo "used_percentage:$used_percentage"
          fi
       done
}
#one second traffic data.
traffic(){
    local old_rx old_tx new_rx new_tx
     old_rx=$(ifconfig eth0 | awk '/RX/&&/packets/{print $2}' |cut -d ":" -f2)
     old_tx=$(ifconfig eth0 | awk '/TX/&&/packets/{print $2}' |cut -d ":" -f2)
     sleep 1   
     new_rx=$(ifconfig eth0 | awk '/RX/&&/packets/{print $2}' |cut -d ":" -f2)
     new_tx=$(ifconfig eth0 | awk '/TX/&&/packets/{print $2}' |cut -d ":" -f2)
     RX=$(($new_rx-$old_rx))
     TX=$(($new_tx-$old_tx))
     echo "RX:${RX}KB/S"
     echo "TX:${TX}KB/S" 
}
traffic
disk
memory
cpu
