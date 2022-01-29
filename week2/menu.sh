#!/bin/bash

# Password protected menu
# Brett Harris 26/1/2022

# Run the password checker script
./passwordCheck.sh

# if the script returns a 0, show the menu
if [ $? = 0 ]; then 
	echo "Please select:"
	echo "1. Create a folder"
	echo "2. Copy a folder"
	echo "3. Set a password"
	read -n 1 choice #get a single character
	echo

	case "$choice" in
		1) ./foldermaker.sh
		   ;;
		2) ./folderCopier.sh
		   ;;
		3) ./setPassword.sh
		   ;;
		*) echo "Invalid selection"
		   ;;
	esac
fi

echo "Goodbye"
exit 0
