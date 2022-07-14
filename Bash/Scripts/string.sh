#!/bin/bash

# In this script, I am gonna 
# use String Substitution technique.

echo "See the magic of String Substitution"
echo 
echo "Let's assign a variable first..."
echo "VAR=Some Thing"
VAR="Some Thing"
echo "echo \${VAR}: $VAR"
echo
echo "Using substitution - "
echo "echo \${VAR/Some/A}: ${VAR/Some/A}"
echo
echo "Substring - "
echo "It substrings a string from 0 index to 4."
echo "echo \${VAR:0:4}: ${VAR:0:4}"
echo "It substrings last 5 characters."
echo "Note: I used a space after colon, here only."
echo "echo \${VAR: -5}: ${VAR: -5}"
echo
echo "Length of string :"
echo "\${#VAR}:  ${#VAR}"
echo
echo "Exiting for now."
