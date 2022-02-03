#!/bin/bash

# Create an array to hold our fruit
fruit=("Apple" "Mango" "Strawberry" "Orange" "Banana")

# Iterate through the array using a for loop
for ((i=0; i<${#fruit[@]}; i++))
do
    echo "FRUIT: ${fruit[i]}"
done
