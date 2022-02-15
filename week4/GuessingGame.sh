#!/bin/bash 
      
 
      
#This function prints a given error 
      
printError() 
      
{ 
      
    echo -e "\033[31mERROR:\033[0m $1" 
      
} 
      
 
      
#This function will get a value between the 2nd and 3rd arguments 
      
getNumber() 
      
{ 
      
    read -p "$1: " 
      
    while (( $REPLY < $2 || $REPLY> $3 )); do 
      
        printError "Input must be between $2 and $3" 
      
        read -p "$1: " 
      
    done 

    number=$REPLY
      
} 

number=0
      
while [[ $number -ne 42 ]]; do

    getNumber "please type a number between 1 and 100" 1 100
    
    if [[ $number -lt 42 ]]; then

        echo -e "\033[34mToo Low!\033[0m"
    else
    
        echo -e "\033[33mToo High!\033[0m"

    fi

done

echo -e "\033[32mCorrect!\033[0m"
