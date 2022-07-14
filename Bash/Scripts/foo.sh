#!/bin/bash

echo "Using Foo in Bash : "
echo "Foo (maybe) contains null or empty object."
echo "If a var is empty or null then we can use :-"
echo "to conditionize the command to use other value for that var."
echo "Var=\"\""
echo "declared Var as a empty string."
echo "\${Var}: ${Var}"
echo "Its nothing right."
echo "Now see - "
echo "\${Var:- "I get assign if Var is empty"}: ${Var:- "I get assign if Var is empty"}"
echo "It works right."
echo "Var="Hello World""
Var="Hello World"
echo "\${Var:- "I get assign if Var is empty"}: ${Var:- "I get assign if Var is empty"}"
echo "U can see the technique."
echo
