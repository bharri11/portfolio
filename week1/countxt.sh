#!/bin/bash

# Author: Brett Harris
# Created: 20/1/2022

# Takes a text file as an argument and prints the number of
# characters, words, sentences, and paragraphs in the file.
# This is a very simple counter and is based on some very
# basic assumptions:
# 1. a line feed implies the end of a pragraph. A double
# line feed will count as 2 paragraphs, etc.
# 2. A period, exclamation mark, or question mark implies
# the end of a sentence. An ellipsis will count as 3
# sentences, for example.
# 3. A space delimits two words. Double spaces will count as 2
# words, for example.
# 4. Anything else is considered a character, including non-
# printable characters and all other punctuation.

# usage: ./countxt <filename>

# check one argument is passed to the script and display
# usage instructions if not
if [ $# -ne 1 ]; then
    echo "Usage: ./countxt.sh <filename>"
    echo "where <filename> is the full path to the file you wish to check"
else
# continue with the script

#initialise variables for word count, sentence count, and paragraph count
charcnt=0
wordcnt=0
sentcnt=0
paracnt=0

#read the contents of the file 1 character at a time
while read -N 1 char 
  do
    #assign the ascii value of the character to a variable called "ascii"
    printf -v ascii "%d" "'$char'"


    case $ascii in

	10) #line feed = paragraph
	    ((paracnt++))
	    ((wordcnt++)) #count final word of paragraph
			  #because it isn't delimeted by a space
	    ;;

	33 | 46 | 63) #period, exclamation mark, or question mark = sentence
	    ((sentcnt++))
	    ;;

	32) #space = word
	    ((wordcnt++))
	    ;;

	*)
	    ((charcnt++))
	    ;;

    esac

done <$1

#print the results to the screen
echo "File \"$1\" contains:"
echo "$charcnt characters"
echo "$wordcnt words"
echo "$sentcnt sentences"
echo "$paracnt paragraphs"

fi 

#exit cleanly
exit 0
