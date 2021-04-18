#! /bin/bash
  
# 1- checking if the current user is login as root
ID=$(id -u)

if 
        [[ $ID -eq 0 ]]
then
        echo "the user is root"
else
        echo "the user is a regular user and cannot run this script please login ans a root user"

exit 1
fi

# 2- create a user call christine
   # a - checking is user christine exist
USER=christine
id $USER

if 
	[[ ${?} -eq  0 ]]
then 
	echo " the user $USER exist"
else
	echo "the user $USER does not exist"

sleep 3
 echo " creating user $USER"
 useradd $USER
echo "checking if user has been created"
id $USER
fi

PASSWD=abc123
echo $PASSWD | passwd $USER  --stdin
usermod -aG sudo $USER















~                                                                                                                  
~                                                                                                                  
~    
