#!/bin/bash

U=root
FREEM=`free -h | grep Mem | awk '{print $4}'`
UPTIME=`uptime -p`
LOAD=$(df -h | grep /root | awk '{print $4}')
echo "Welcome $U of $HOSTNAME"
echo
echo "Machine is running : $UPTIME"
echo "Current free ram : $FREEM"
echo "Current load free on Root : $LOAD"
echo
