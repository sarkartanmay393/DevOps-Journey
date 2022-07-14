#!/bin/bash

# Example of Command line arguments.
# We use args here in form of $1 $2 first, second args
# and $0 is the file executable file itself.

# $1 is which file to archive.
# $2 where to move that archived file.

echo "$1 is getting archived..."
gzip $1
lookup=`find $1.gz`
echo "Archived file : $lookup"
echo "Moving archived file to $2..."
mv $lookup $2
echo "File moved."
ls $2
echo "Task done."
