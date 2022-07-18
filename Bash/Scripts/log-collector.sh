#!/bin/bash

alert=90
df -H| awk '{print $5 " " $1}' | while read output;
do  
    # echo "Disk Usage: $output"
    usage=`echo $output | awk '{print $1}' | cut -d% -f1`
    disk=`echo $output | awk '{print $2}'`
    if [ $usage -ge $alert ] 
    then
        echo "Critical : $disk usage is $usage"
    fi    
done