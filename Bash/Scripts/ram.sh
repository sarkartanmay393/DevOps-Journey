#!/bin/bash

: ' This script tells us about the ram usage of system 
in current time.
'
# example of multilne comment above.

echo "Ram usage : "
total=`free -h | grep Mem | awk '{print $2}'`
used=`free -h | grep Mem | awk '{print $3}'`
free=$(free -h | grep Mem | awk '{print $4}')
# we can use `` or $() for command substitution.
echo "$used/$total"
echo "Free $free"
