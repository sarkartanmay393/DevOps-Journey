#!/bin/bash

echo "Let's use Looping and Conditioning in BASH."
echo "Note: cat the script to see all command codes"
read -p "What's your family name ? " FAMILY
read -p "What's your mother family ? " MFAMILY
if [[$FAMILY == $MFAMILY]]
then
  echo "Congralutions, Your mom and dad was a coincidence."
#elif ["${FAMILY}" = ""]
#then
#  echo "You have to build your own indentity."
else
  echo "You are half $FAMILY and half $MFAMILY."
fi
echo "Exiting..."
