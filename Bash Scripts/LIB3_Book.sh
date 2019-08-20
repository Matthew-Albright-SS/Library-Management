#!/bin/bash
#This Script Displays the Titles of the Books you can modify
echo "Pick the Book you want to add copies of, to your branch:"
IFS=$'\n' ARRAYVAR=( $( mysql -N -u root  library -e "CALL LIB2_Book($bId);" ) )
counter=$((1))
userselection=$((1))
for i in "${ARRAYVAR[@]}"
	do
		IFS=$'\t' read -r col1 col2 <<< "$i"
		echo "$counter)  $col1 by $col2"
		counter=$(($counter+1))
	done
echo "$counter)  Quit to previous"
read userselection
if [ $userselection -eq "$counter" ]
	then
		sh ./LIB2_Branch.sh
fi
#Pull in the Book Name and Title
IFS=$'\t' read -a nameadd <<< "${ARRAYVAR[$(($userselection-1))]}"
bookTitle=${nameadd[0]}
bookAuthor=${nameadd[1]}
export bookTitle
export bookAuthor
sh ./LIB3_2.sh