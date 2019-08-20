#!/bin/bash
#This Script Handles Borrower Function
#Enter Your Card Number4

echo "Enter the your Card Number:"
read cardNumber
export cardNumber
#Check Card Validity
IFS=$'\n' VALID=( $( mysql -N -u root library -e "CALL BORR1($cardNumber);" ) )
Validity=${VALID[0]}
if [ $Validity -eq "1" ]
	then
	echo "Welcome '$cardNumber'"
	sh ./BORR1.sh
else
	echo "Quitting.... Invalid Card Number"
	sh ./mainmenu.sh
fi
read nalls