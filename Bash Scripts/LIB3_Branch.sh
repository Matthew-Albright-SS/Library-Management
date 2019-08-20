#!/bin/bash
#This Script Handles LIB3 Updating The Branches / Book Copies
#Update / Add Copies / Quit
echo "1) Update the Details of the Library"
echo "2) Add copies of Book to the Branch"
echo "3) Quit to previous"
read userinput
if [ $userinput -eq "1" ]
	then
		echo "You have chosen to update the Branch with Branch Id: $bId and Branch Name: $bName. Enter ‘quit’ at any prompt to cancel operation."
		sh ./LIB3_1.sh

elif [ $userinput -eq "2" ]
	then
		sh ./LIB3_Book.sh
else
		sh ./LIB1.sh

fi