#!/bin/bash

# Check entered password against a hash of a password stored in a file
# Brett Harris 26/1/2022

# Get the directory. If it doesn't exist, ask again
while true; do
	read -p "Enter the directory containing the secret.txt file: " folder
	if [ -d "$folder" ]; then # valid directory
		break;
	elif [ "$folder" = "q" ]; then # user typed 'q' to exit
		exit 0
	else
		echo "Invalid directory entered. Please try again or 'q' to quit"
	fi
done

# Get the password (don't echo the input)
read  -s -p "Type your password: " passwd
echo # New line

# hash the password and pass through sed to tidy it up and remove the trailing space and hyphen
passwd=$(echo "$passwd" | sha256sum | sed 's/ .*//')

# Read the hash of the password from secret.txt.
read pwdhash < "$folder"/secret.txt

# compare the hashed password with the hash read from the file
if [ "$pwdhash" = "$passwd" ]; then
	# they match:
	echo "Access Granted"
	exit 0
else
	# they don't match:
	echo "Access Denied"
	exit 1
fi
