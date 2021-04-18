#! /bin/bash
# checking if statement 
userdel  dataservicegroup
if 
	[[ $? -eq 0  ]]
then 
	echo ' the user dsg was deleted'
else 
	echo ' the user dsg was not deleted'
fi 


useradd  houston
if
        [[ $? -eq 0  ]]
then
        echo ' the user houston  was added'
else
        echo ' the user houston was not added'
fi

useradd  delaware
if 
        [[ $? -eq 0  ]]
then
        echo ' the user delaware was added'
else
        echo ' the user delaware was not added'
fi

