#!/bin/bash

# A simple integer calculator
# Brett Harris 30/1/2022

# TODO: - Remove repetitive spaces and replace with tabs
#       - See if printf would make formatting easier
#       - Repeat the entire menu after each calculation

# Set the prompt for the menu
PS3="Choose the operator (type of calculation): "

# Create and display the operation menu
select calc in Add Subtract Multiply Divide Quit; do

	# Set up some variables based on the operator selected
	case $calc in
		"Add")
			operator="+"
			op1="(augend)       "
			op2="(addend)      "
			answer="(sum) is:        "
			;;
		"Subtract")
			operator="-"
			op1="(minuend)      "
			op2="(subtrahend)  "
			answer="(difference) is: "
			;;
		"Multiply")
			operator="*"
			op1="(multiplicand) "
			op2="(multiplier)  "
			answer="(product) is:    "
			;;
		"Divide")
			operator="/"
			op1="(dividend)     "
			op2="(divisor)     "
			answer="(quotient) is:   "
			;;
		"Quit")
			echo "Exiting..."
			exit
			;;
        *)
			echo "invalid option $REPLY"
			;;
    esac

	# Get the two numbers from the user
	echo
	read -p "Enter the first number $op1" num1
	echo "                                      $operator"
	read -p "Enter the second number $op2" num2

	# Perform the calculation and set the colour variable according to the operator chosen	
	case $operator in
		"+")
			result=$(echo $num1+$num2 | bc)
			colour="\033[34m"
			;;
		"-")
			result=$(echo $num1-$num2 | bc)
			colour="\033[32m"
			;;
		"*")
			result=$(echo $num1*$num2 | bc)
			colour="\033[31m"
			;;
		"/")
			result=$(echo $num1/$num2 | bc)
			colour="\033[35m"
			;;
	esac

	# Find out which number is the longest (number 1, number 2, or the result)
	length=${#num1}
	if [ ${#num2} -gt $length ]; then
		length=${#num2}
	fi
	if [ ${#result} -gt $length ]; then
		length=${#result}
	fi

	# Print the result, with dashes above and below the same length as the longest number
	echo -n "                                      "
	for (( i = 0; i < $length; i++ ))
		do
			echo -n "-"
		done
	echo
	echo -e "The answer $answer $colour         $result"
	echo -ne "\033[0m                                      "
	for (( i = 0; i < $length; i++ ))
		do
			echo -n "-"
		done
	echo
	echo

done

