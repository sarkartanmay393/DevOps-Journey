#!/bin/bash

echo "Lets validate email address : "
read -p "Enter email : " email
if [["$email" =~ [a-z]+@[a-z]{2,}\.(com|org|net) ]]
then echo "Valid Email."
else echo "Invalid."
fi
echo "Exiting..."
