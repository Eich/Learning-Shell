#!/bin/bash
#echo-color-string
#if you  want to echo color string,please use -e parameter. just for example
#echo -e "\033[string-color;background-colormstring\033[0m"
#echo -e "\033[32;40mcolor-string\033[0m"   32==green,40==black
#first function $1 is first parameter,$2 is second parameter.
function echo_color(){
    if [  $1 == "green" ];
    then echo -e "\033[32;40m$2\033[0m"
    elif [ $1 == "red" ];
    then echo -e "\033[31;40m$2\033[0m"
    fi
}
#second function
function echo_color2(){
   case $1 in
   green)
   echo -e "\033[32;40m$2\033[0m";;
   red)
   echo -e "\033[31;40m$2\033[0m";;
   *) echo "echo_color2 function must enter {green| red}"
   esac
}

echo_color green "green is first function"
echo_color2 red "red is second function "
