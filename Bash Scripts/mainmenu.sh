#!/bin/bash
export MYSQL_PWD=password
#Intro Welcome Message for User to Select Which Category they are
echo "Welcome to the GCIT Library Management System. Which category of a user are you"
echo "1) Librarian"
echo "2) Administrator"
echo "3) Borrower"
read userinput
#Conditional Statements for User Selection
if [ $userinput -eq "1" ]
	then
		sh ./LIB1.sh

elif [ $userinput -eq "2" ]
	then
		sh ./ADMIN1.sh
		echo "Administrator"

else
		sh ./borrower.sh

fi