#!/bin/bash

# Check entered password against a hash of a password stored in a file
# Simplified version that only checks for the secret.txt file in the current directory
# Brett Harris 26/1/2022
# Updated 1/2/2022

# Get the password (don't echo the input)

echo -e -n "\033[34mType your password: \033[0m"
read -s passwd
echo # New line

# hash the password and pass through sed to tidy it up and remove the trailing space and hyphen
passwd=$(echo "$passwd" | sha256sum | sed 's/ .*//')

# Read the hash of the password from secret.txt.
read pwdhash < ./secret.txt

# compare the hashed password with the hash read from the file
if [ "$pwdhash" = "$passwd" ]; then
	# they match:
	echo -e "\033[32mAccess Granted\033[0m"
	exit 0
else
	# they don't match:
	echo -e "\033[31mAccess Denied\033[0m"
	exit 1
fi
