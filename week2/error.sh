#!/bin/bash

# script used to check debugging abilities
# script acts as a shell for a password/secret checking routine
# that will display a menu if the code is correctly entered
# Brett Harris 29/1/2022

secret='shhh' #Don't tell anyone!

# ask the user for the secret code
read -s -p "what's the secret code? "
echo

#if the user types in the correct secret, tell them they got it right!

if [ "$secret" = "$REPLY" ]; then
    echo "You got it right!"
    correct=true
else
    echo "You got it wrong :("
    correct=false
fi

# show menu if the correct secret was typed
case $correct in
    true)
        echo "you have unlocked the secret menu!"
        # TODO: add a secret menu for people in the know.
        ;;
    *)
        echo "Go Away!" # people who get it wrong need to be told to go away!
        ;;
esac

# Original code downloaded from ECU Blackboard, CYB6004, Week 2.6
