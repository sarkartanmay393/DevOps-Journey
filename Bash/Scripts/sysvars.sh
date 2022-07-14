#!/bin/bash

# This are called System Variables.

echo "echo \$0 - Prints script's name itself."
echo $0 
echo "echo \$# - Prints number of agrs passed in that script."
echo $#
echo "echo \$@ - Prints every args."
echo $@
echo "echo \$$ - Prints script's PID."
# Process ID.
echo $$
echo "echo \$? - Prints last program's return code."
echo $?
echo "echo \$1 \$2 - Prints first and second arg."
echo $1 $2

# Try executing the script, passing demo arguments.
