#!/bin/bash
#This Script Handles Librarian Function
#Select Branch or Quit
echo "1) Enter Branch you manage"
echo "2) Quit to previous"
read userinput
if [ $userinput -eq "1" ]
			then
				echo "Managing branch"
				IFS=$'\n' ARRAYVAR=( $( mysql -N -u root  library -e "show tables;" ) )
				counter=$((1))
				for i in "${ARRAYVAR[@]}"
					do
						IFS=$'\t' read -r col1 <<< "$i"
						echo "$counter  $col1"
						counter=$(($counter+1))
done
		else
				echo "Quitting.... Returning to Main Menu"
				sh ./mainmenu.sh
fi