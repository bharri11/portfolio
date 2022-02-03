#!/bin/bash

# Store a password in a text file in a chosen folder
# Brett Harris 26/1/2022

# Get the desired folder
read -p "Type the name of the folder: " folder

# if the folder does not exist, ask user if we should create it
if [ ! -d "$folder" ]; then
	read -s -n 1 -p "That folder doesn't exist, create it? y/n " makefld
	echo
	if [[ $makefld = "y" ]] || [[ $makefld = "Y" ]]; then
		mkdir "$folder"
	else
		exit 0
	fi
fi

# Get the password (don't echo the input)
read  -s -p "Type your password: " passwd
# New line
echo

# Save the hash of the password to secret.txt in the chosen folder.
# Because we pipe the password using stdio to sha256sum to hash it,
# it will append a space and hyphen at the end of the hash. To tidy
# this up we pass the hash to sed to remove the space and any subsequent
# characters
echo "$passwd" | sha256sum | sed 's/ .*//' > "$folder"/secret.txt

# Exit cleanly
exit 0
