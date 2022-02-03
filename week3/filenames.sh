#!/bin/bash

# Iterate through the lines of a text file
# Brett Harris 30/1/2022
# Updated 1/2/2022: added additional clarity and colour in error messages
# Usage: ./filenames.sh <filename>
# where <filename> is a text file containing a list
# of filenames to check

# Check if a single filename was included as an argument
if [ $# -ne 1 ]; then
    echo -e "\033[31mIncorrect argument supplied - provide a single filename\033[0m"
    echo "Usage: ./filenames.sh <filename>"
    exit 1
elif [ ! -f "$1" ]; then
    echo -e "\033[31mThe filename supplied isn't a valid file\033[0m"
    exit 2
elif [[ "$1" != *.txt ]]; then
    echo -e "\033[31mThe filename supplied isn't a valid text file\033[0m"
    echo "Provide a filename ending in .txt"
    exit 3
fi

# Read the file line by line and check the filenames
for name in $(cat "$1")
do
    if [ -f $name ]; then
        echo "$name - That file exists"
    elif [ -d $name ]; then
        echo "$name - That's a directory"
    else
        echo "$name - I don't know what that is!"
    fi
done
