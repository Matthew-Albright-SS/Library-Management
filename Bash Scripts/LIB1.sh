#!/bin/bash
#This Script Handles Librarian Function
#Select Branch or Quit
echo "1) Enter Branch you manage"
echo "2) Quit to previous"
read userinput
if [ $userinput -eq "1" ]
			then
				sh ./LIB2_Branch.sh
		else
				echo "Quitting.... Returning to Main Menu"
				sh ./mainmenu.sh
fi