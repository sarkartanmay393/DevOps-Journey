#!/bin/bash

echo "Declaring a array : array=(i am god of the human race)"
array=(i am god of the human race)
echo "Two ways to print first ele - "
echo "echo \$array or echo \${array[0]}"
echo $array "${array[0]}"
echo "Accessing other ele - "
echo "echo \${array[1]} \${array[2]}"
echo "${array[1]} ${array[2]}"
echo "Printing other ele - "
echo "echo \${array[@]}"
echo "${array[@]}"
echo "Printing last two ele - "
echo "echo \${array[@]:1:2}"
echo "${array[@]:1:2}"
echo "Printing Lengths - "
echo "echo \${#array[2]}" # prints length of second ele.
echo "${#array[2]}"
echo "echo \${#array[@]}" # prints length of all.
echo "${#array[@]}"
echo ####################
echo "Lets talk a little about of looping : "
echo "I am gonna print each ele of array in a new line."
for i in ${array[@]}; do
	echo "$i"
done
echo "See code if need."


