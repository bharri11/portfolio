#!/bin/bash

# A sample of grep commands using regex expressions.

# Brett Harris 19/2/2022

# all sed statements
echo "Find all lines with sed statements"
grep -r --colour " sed " ../*

# all lines that start with the letter m
echo "Find all lines starting with the letter m"
grep -r "^m" ../*

# all lines that contain three digit numbers (and only 3 digit numbers)
echo "Find all lines that contain 3 digit numbers"
grep -Pr --colour "(?<![0-9])[0-9]{3}(?![0-9])" ../*

# all echo statements with at least three words. It works as follows:
# (-\w+\s+)* accounts for none or more parameters, e.g. "-n -e", or "-ne"
# [\'\"]? matches for none or one single or double quote
# ([\w,'.!?+-]+ ){2,} matches any one or more word characters and/or punctuation
# followed by a space, which must appear 2 or more times
# \w+ adds a final word to the end of the list, making 3 words in total.
echo "Find all lines contianing an echo statement with at least three words"
grep -Pr --colour "echo (-\w+\s+)*[\'\"]?([\w,'.!?+-]+ ){2,}\w+" ../*

# all lines that would make a good password
# The regex makes use of lookahead assertions to ensure the word contains at least
# 1 lower case letter, 1 upper case letter, 1 number, and 1 special character
# and the word is 8 characters in length or more.
echo "Find all lines contianing text that would make a good password"
grep -Pr --colour "(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[+=<>#@$!%*?&])(?!.* )(.*){8,}" /*





