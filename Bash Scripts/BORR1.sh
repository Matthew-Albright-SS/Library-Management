#!/bin/bash
#This Script Handles Borrower Function
#Select Branch or Quit
echo "1) Check out a book"
echo "2) Return a Book"
echo "3) Quit to Previous (should take you menu MAIN)"
read userinput
if [ $userinput -eq "1" ]
	then
		sh ./BORR1_Branch_Checkout.sh
elif [ $userinput -eq "2" ]
	then
		sh ./BORR1_Branch_Return.sh
else
		sh ./mainmenu.sh
fi