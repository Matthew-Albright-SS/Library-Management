#!/bin/bash
#This Script Handles LIB2 List Library Branches with Names and Locations
echo "Pick the Branch you want to return book to:"
IFS=$'\n' ARRAYVAR=( $( mysql -N -u root  library -e "CALL LIB2_Branch;" ) )
counter=$((1))
userselection=$((1))
for i in "${ARRAYVAR[@]}"
	do
		IFS=$'\t' read -r col1 col2 <<< "$i"
		#IFS=$'\t' LIBS=( "$col1" )
		echo "$counter)  $col1, $col2"
		counter=$(($counter+1))
	done
echo "$counter)  Quit to previous"
#The branch picked
read userselection
if [ $userselection -eq "$counter" ]
	then
		sh ./BORR1.sh
fi
#Pull in the Branch ID
IFS=$'\t' read -a nameadd <<< "${ARRAYVAR[$(($userselection-1))]}"
IFS=$'\n' BRANCHID=( $( mysql -N -u root  library -e "CALL LIB2_Bid('${nameadd[0]}','${nameadd[1]}');" ) )
bId=${BRANCHID[0]}
bName=${nameadd[0]}
export bName
export bId
#Lists the Books You Have Checked Out
echo "Books currently checked out:"
IFS=$'\n' ARRAYVAR=( $( mysql -N -u root  library -e "CALL BORR1_Checked_Books($bId, $cardNumber);" ) )
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
		sh ./BORR1.sh
fi
#Pull in Book Id Data
IFS=$'\t' read -a nameadd <<< "${ARRAYVAR[$(($userselection-1))]}"
bookTitle=${nameadd[0]}
bookAuthor=${nameadd[1]}
export bookTitle
export bookAuthor
IFS=$'\n' BOOKID=( $( mysql -N -u root  library -e "CALL LIB3_bookId('$bookTitle');" ) )
echo "Please enter the number of book(s) you would like to return"
read bookstoReturn
#Book Check Out Procedure
RETURN=( $( mysql -N -u root  library -e "CALL BORR1_2(${BOOKID[0]}, $bId, $cardNumber, $bookstoReturn);" ) )
Successful=${RETURN[0]}
if [ $Successful -eq "0" ]
	then
		echo "Incorrect number of copies or invalid return."
	else
		echo "Return Complete"
fi
sh ./mainmenu.sh

