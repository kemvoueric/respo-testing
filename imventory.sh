#!/bin/bash
#Description: inentory a server 
#Author:
#Date: 01/16/2021
clear


echo This script  will is made to  run the inventory of Linux base Operating system server 
sleep 2
echo 'checking the OS running and version'
OS=$(cat /etc/rel |grep PRETTY_NAME |awk -F= '{print $2}'|awk -F '"' '{print$2}'|awk '{print $1}')
OS1=$(echo $'\e[1;33m'$OS$'\e[0m')
VERSION=$(cat /etc/*release  |grep -w "VERSION_ID=" |awk -F '"' '{print $2}') 
VERSION1=$(echo $'\e[1;33m'$VERSION$'\e[0m')


sleep 3
echo 
echo you are using a webserver with $OS1  version $VERSION1  as operating system
sleep 1
echo
echo checking the  Size of memory your $OS server

MEM_TOTAL=$(free -m | grep -i  mem | awk '{print $2}')
MEM_TOTAL1=$(echo $'\e[1;33m'$MEM_TOTAL$'\e[0m')

MEM_USED=$(free -m | grep -i  mem | awk '{print $3}')
MEM_USED1=$(echo $'\e[1;33m'$MEM_USED$'\e[0m')

MEM_FREE=$(free -m | grep -i  mem | awk '{print $3}')
MEM_FREE1=$(echo $'\e[1;33m'$MEM_FREE$'\e[0m')


echo
sleep 3

echo  your total memory is  ${MEM_TOTAL1}Mi actually you are using ${MEM_USED1}Mi and your free memory is ${MEM_FREE1}Mi
sleep 2
echo
echo checking the Size of hardrive
sleep 1
echo here is the information of your hardrive 
lsblk |grep sda |awk '{print $1 "                   " $4}'




echo
sleep 3

echo checking your Cpu speed 
CPU=$(lscpu | grep -i mhz |awk '{print $3}')
CPU1=$(echo $'\e[1;33m'$CPU$'\e[0m')

echo your CPU speed is $CPU1


echo
sleep 3


echo checking the Kernel version
KERNEL=$(uname -r | awk -F- '{print $1}')
KERNEL1=$(echo $'\e[1;33m'$KERNEL$'\e[0m')
echo your Kernel version is $KERNEL1

echo
sleep 3


echo checking your system bits 
BITS=$(arch  | awk -F_  '{print $2}')
BITS1=$(echo $'\e[1;33m'$BITS$'\e[0m')
echo the system  is $BITS1 bits


echo
sleep 3




echo checking the hostname
HOST=$(hostname)
HOST1=$(echo $'\e[1;33m'$HOST$'\e[0m')
echo your hostname is $HOST1


echo
sleep 3




echo checking the ip address
IP_ADDR=$(ip r l |tail -1 | awk '{print $9}')
IP_ADDR1=$(echo $'\e[1;33m'$IP_ADDR$'\e[0m')
echo your IP address is $IP_ADDR1

echo
sleep 3


echo here is the list of all opened ports
netstat -tulpn | grep LISTEN | awk '{print $1 "                  " $7}' | awk -F/ '{print $1}'

echo
sleep 3



echo  here is the dns information 
DNS=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
DNS1=$(echo $'\e[1;33m'$DNS$'\e[0m')
echo your DNS is $DNS1


echo
sleep 3

 echo checking the manufacturer
 MANUF=$( cat /sys/class/dmi/id/board_vendor)
 MANUF1=$(echo $'\e[1;33m'$MANUF$'\e[0m')
 echo the manufacturer is $MANUF1

echo
sleep 3

echo checking if  the system virtual or physical
PHY=$(dmidecode -s system-manufacturer | awk '{print $2}')
PHYC=$(dmidecode -s system-manufacturer )
PHYC1=$(echo $'\e[1;33m'$PHYC$'\e[0m' )
PHY1=$(echo $'\e[1;33m'$PHY$'\e[0m')

      if 
         [[  $PHY == GmbH  ]]
         then 
         echo  we ran some tests and found this $PHY1 , therefore the system is virtual 
         else 
         echo  we ran some tests and found this $PHYC1, therefore the system is Physical 
         fi
echo
sleep 3

echo here is  the  MAC address for all your devices
 ip link show
sleep 3
echo -e "\033[33;32m  END OF THE INVENTORY"
sleep 2
echo $'\e[1;33m'It was a pleasure to serve you $'\e[0m'
















