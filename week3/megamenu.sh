#!/bin/bash

# Password protected menu - Version 2
# Brett Harris 1/2/2022
# Menu list is expanded with week 3 scripts
# Menu repeats until exit, added colours
# Menu item 6 (Check Filenames) lists the text files to choose from

tries=0		# used to track the number of password attempts
fname=		# used for the filename in the Check Filenames option

# Function to choose the text file for the Check Filenames option
chooseFile() {

	txtfiles=()  # initialise the variable or else it keeps accumulating each time the function runs

	for listing in ./*	# Get a list of all files in the current directory
	do
		if [[ "$listing" == *.txt ]]; then	# if the extension is .txt
			
			# add the filename to the array of text files. Use sed to strip the leading ./ 
			txtfiles+=($(echo $listing | sed 's:.*/::'))

		fi
	done

	if [[ ${#txtfiles} = 0 ]]; then

		echo -e "\033[31mNo files containing filenames were found in the current directory."
		echo -e "The file must be a text file (*.txt)\033[0m"
		echo "Press any key to continue."
		read -s -n 1

		return 1  # let the calling function know we didn't provide a filename

	else
		
		echo
		echo -e "\033[32mPlease select the file containing the list of filenames:"

		for i in ${!txtfiles[@]};  # loop through the array
		do
			echo -e "\033[35m$((i+1)). ${txtfiles[i]}\033[0m" # print a numbered list of files
		done

		echo
		read -n 1 -s choice

		# handle incorrect choice selected
		if [[ $choice -lt 1 ]] || [[ $choice -gt ${#txtfiles[@]} ]]; then
			echo -e "\033[31mInvalid choice.\033[0m"
			echo "Press any ket to return."
			read -s -n 1
			return 1	
		else
			# valid choice selected, update fname variable and return
			fname=${txtfiles[(($choice-1))]}
			return 0  # let the calling function know we returned a filename
		fi
	fi
}

while true  # Keep repeating the password check until successful or too many attempts
do

	# Run the password checker script
	./passwordCheck.sh

	# if the script returns a 0, show the menu
	if [ $? = 0 ]; then
		while true	# Once the password is correctly entered, keep repeating the menu
		do			# until the user quits
			echo
			echo -e "\033[35mPlease select an option: \033[36m"
			echo "1. Create a folder"
			echo "2. Copy a folder"
			echo "3. Set a password"
			echo "4. Calculator"
			echo "5. Create Week Folders"
			echo "6. Check Filenames"
			echo -e "7. Download a File\033[0m"
			echo "8. Exit"
			echo
			read -s -n 1 choice   # get a single character

			case "$choice" in	# execute the respective script based on user selection
				1)  echo "1. Create a folder:"
					./foldermaker.sh
					;;
				2)  echo "2. Copy a folder:"
					./folderCopier.sh
					;;
				3)  echo "3. Set a password:"
					./setPassword.sh
					;;
				4)	echo "4. Calculator:"
					./calc.sh
					;;
				5)	echo "5. Create Week Folders:"
					read -p "Enter the first week's number: " arg1
					read -p "Enter the final week's number: " arg2
					./megafoldermaker.sh $arg1 $arg2
					;;
				6)	echo "6. Check Filenames:"
					chooseFile   # run the function to ge the name of the text file
					if [[ $? = 0 ]]; then  # if the fuction returns 0 (a file was selected)
						./filenames.sh $fname
					fi
					;;
				7)	echo "7. Download a File:"
					./InternetDownloader.sh
					;;
				8)  echo -e "\033[33mGoodbye\033[0m"
					echo
					exit 0
					;;
				*)  echo "That was an invalid selection ($choice)"
					;;
			esac
		done
	
	else	# incorrect password was entered
		((tries++))
		if [ $tries -gt 2 ]; then  # after 3 incorrect guesses, exit
			echo "Too many incorrect attempts. Goodbye"
			exit 1
		else
			echo "Incorrect password entered. Please try again"
		fi

	fi

done
