#!/bin/bash
#this script is creating multiple users and  stored their users and passwords in file.
#{1..5} it means 1 to 5. $RANDOM  it means creating random password 
function echo_color(){
    if [  $1 == "green" ];
    then echo -e "\033[32;40m$2\033[0m"
    elif [ $1 == "red" ];
    then echo -e "\033[31;40m$2\033[0m"
    fi
}
for USER in user{1..5};do
  if ! id $USER &>/dev/null;then
  PASS=$(echo $RANDOM | md5sum | cut -c 1-8)
  useradd $USER
  echo $PASS | passwd --stdin $USER &> /dev/null
  echo -e "$USER\t$PASS" >>user_file
  echo "$USER user create successful."
 else
   echo_color red "$USER user is exist"
  fi
done  
