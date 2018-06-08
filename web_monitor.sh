#!/bin/bash
#this is monitoring  web status script.
function URL_CHECK(){
   HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" $1)
    if [ $HTTP_CODE -ne 200 ];then
           echo "$1 Access failure!"
    else
           echo "$1 Access successful."
    fi
}


URL_LIST="www.baidu.com www.baidu123abc.com www.jd.com "

for URL in $URL_LIST;do
    URL_CHECK $URL
done
