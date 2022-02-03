#!/bin/bash

# Internet downloading script. Download a selected URL to a chosen directory
# Brett Harris 31/1/2022

# Continue looping until the user types "exit"
while true
do
    read -p "Please type the URL of a file to download or type 'exit' to quit: " address

    if [ ${address,,} == "exit" ]; then  # user types 'exit' (case insensitive)
        break
    else
        read -p "Type the location of where you would like to download the file to: " dir

        # check if it is a valid directory or ask to create it
        if [ ! -d "$dir" ]; then
            read -n 1 -p "That directory doesn't exist. Would you like to create it? y/n " makedir
            if [ ${makedir,,} == "y" ]; then
                mkdir "$dir"
                skip=false
            else
                echo "The file will not be downloaded"
                echo
                skip=true
            fi
        else    # it was a valid directory
            skip=false
        fi

        # Download the file. If there was a problem, display an error message
        if [ $skip == false ]; then
            wget -q -P "$dir" "$address"

            if [ $? -eq 0 ]; then
                echo "File downloaded successfully!"
            else
                echo "The file does not exist at that address. Please try again."
            fi
            echo

        fi

    fi

done

exit 0
