#!/bin/bash
#This Script Handles LIB2 List Library Branches with Names and Locations
echo "Pick the Branch you want to check out from:"
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

echo "Pick the Book you want to check out:"
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
		sh ./BORR1.sh
fi
#Pull in Book Id Data
IFS=$'\t' read -a nameadd <<< "${ARRAYVAR[$(($userselection-1))]}"
bookTitle=${nameadd[0]}
bookAuthor=${nameadd[1]}
export bookTitle
export bookAuthor
IFS=$'\n' BOOKID=( $( mysql -N -u root  library -e "CALL LIB3_bookId('$bookTitle');" ) )

#Book Check Out Procedure
CHECKOUT=( $( mysql -N -u root  library -e "CALL BORR1_1(${BOOKID[0]}, $bId, $cardNumber);" ) )

echo "Checkout Complete"
sh ./mainmenu.sh