#!/bin/bash

# copy a folder to a new location
# Brett Harris 26/1/2022
      
read -p "type the name of the folder you would like to copy: " folderName 
      
# if the name is a valid directory 
      
if [ -d "$folderName" ]; then 
      
    # copy it to a new location if the new location exists
      
    read -p "type the name of the destination folder: " newFolderName 

    if [ -d $newFolderName ]; then
        cp -r "$folderName" "$newFolderName" 
    else
        echo "The destination folder doesn't exist"
    fi
      
else 
      
    # otherwise, print an error 
      
    echo "I couldn't find that folder" 
      
fi 
     
