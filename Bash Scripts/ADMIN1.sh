#!/bin/bash
#This Script Handles Librarian Function
#Select Branch or Quit
echo "Welcome Administrator, Choose what you would like to do"
echo "1) Add/Update/Delete Book and Author"
echo "2) Add/Update/Delete Publishers"
echo "3) Add/Update/Delete Library Branches"
echo "4) Add/Update/Delete Borrowers"
echo "5) Over-ride Due date"
echo "6) Quit to Main Menu"
counter=$((1))
read userselectionA
export userselectionA
#----------------------------------------------Option 1-------------------------------------------------------------#
if [ $userselectionA -eq "1" ]
	then
  #This Sections Lists the Books
		IFS=$'\n' ARRAYVAR=( $( mysql -N -u root  library -e "CALL ADMIN1_Book_author;" ) )
		for i in "${ARRAYVAR[@]}"
			do
				IFS=$'\t' read -r col1 col2 col3 <<< "$i"
				echo "$counter)  $col1 by $col2 || Author Id: $col3"
				counter=$(($counter+1))
			done
	echo "$counter)  Quit to previous"
  #This is where the user selects a book
  read bookSelection
  #Pull in Book Id Data
	IFS=$'\t' read -a nameadd <<< "${ARRAYVAR[$(($bookSelection-1))]}"
	bookTitle=${nameadd[0]}
	bookAuthor=${nameadd[1]}
	authorId=${nameadd[2]}
  	IFS=$'\n' BOOKID=( $( mysql -N -u root  library -e "CALL LIB3_bookId('$bookTitle');" ) )
  	bookId=${BOOKID[0]}
	export bookTitle
	export bookAuthor
	export authorId
	export bookId
	if [ $bookSelection -eq "$counter" ]
		then
			sh ./mainmenu.sh
	fi
		sh ./AddUpdateDelete.sh

#----------------------------------------------Option 2-------------------------------------------------------------#
elif [ $userselectionA -eq "2" ]
	then
		IFS=$'\n' ARRAYVAR=( $( mysql -N -u root  library -e "CALL ADMIN1_Publisher;" ) )
		for i in "${ARRAYVAR[@]}"
			do
				IFS=$'\t' read -r col1 col2 col3 <<< "$i"
				echo "$counter)  $col1 || Publisher Id: $col2"
				counter=$(($counter+1))
			done
	echo "$counter)  Quit to previous"
	read publisherSelection
	#Pull in PubId Id Data
	IFS=$'\t' read -a nameadd <<< "${ARRAYVAR[$(($publisherSelection-1))]}"
	pubId=${nameadd[1]}
	export pubId
	if [ $publisherSelection -eq "$counter" ]
		then
			sh ./mainmenu.sh
	fi
		sh ./AddUpdateDelete.sh

#----------------------------------------------Option 3-------------------------------------------------------------#
elif [ $userselectionA -eq "3" ]
	then
		IFS=$'\n' ARRAYVAR=( $( mysql -N -u root  library -e "CALL ADMIN1_Branch;" ) )
		for i in "${ARRAYVAR[@]}"
			do
				IFS=$'\t' read -r col1 col2 col3 <<< "$i"
				echo "$counter)  $col1 || Branch Id: $col2"
				counter=$(($counter+1))
			done
	echo "$counter)  Quit to previous"
	read branchSelection
	#Pull in PubId Id Data
	IFS=$'\t' read -a nameadd <<< "${ARRAYVAR[$(($branchSelection-1))]}"
	branchId=${nameadd[1]}
	export branchId
	if [ $branchSelection -eq "$counter" ]
		then
			sh ./mainmenu.sh
	fi
		sh ./AddUpdateDelete.sh

#----------------------------------------------Option 4-------------------------------------------------------------#
elif [ $userselectionA -eq "4" ]
	then
		IFS=$'\n' ARRAYVAR=( $( mysql -N -u root  library -e "CALL ADMIN1_Borrower;" ) )
		for i in "${ARRAYVAR[@]}"
			do
				IFS=$'\t' read -r col1 col2 <<< "$i"
				#IFS=$'\t' LIBS=( "$col1" )
				echo "$counter)  $col1 || CardNumber: $col2"
				counter=$(($counter+1))
			done
	echo "$counter)  Quit to previous"
	read borrowerSelection
	#Pull in PubId Id Data
	IFS=$'\t' read -a nameadd <<< "${ARRAYVAR[$(($borrowerSelection-1))]}"
	borrowerId=${nameadd[1]}
	export borrowerId
	if [ $borrowerSelection -eq "$counter" ]
		then
			sh ./mainmenu.sh
	fi
	sh ./AddUpdateDelete.sh

#----------------------------------------------Option 5-------------------------------------------------------------#
elif [ $userselectionA -eq "5" ]
	then
		IFS=$'\n' ARRAYVAR=( $( mysql -N -u root  library -e "CALL ADMIN1_Loan;" ) )
		for i in "${ARRAYVAR[@]}"
			do
				IFS=$'\t' read -r col1 col2 col3 col4 col5 col6 col7 <<< "$i"
				#IFS=$'\t' LIBS=( "$col1" )
				echo "$counter)  Book Id: $col1 || Branch Id: $col2 || CNo: $col3 || DateOut: $col4 || DueDate: $col5 || Returned: $col6"
				counter=$(($counter+1))
			done
	echo "$counter)  Quit to previous"
	read loanSelection
	#Pull in PubId Id Data
	IFS=$'\t' read -a nameadd <<< "${ARRAYVAR[$(($loanSelection-1))]}"
	bookId=${nameadd[0]}
	branchId=${nameadd[1]}
	cardId=${nameadd[2]}
	dateOut=${nameadd[3]}
	export bookId
	export branchId
	export cardId
	export dateOut
	if [ $loanSelection -eq "$counter" ]
		then
			sh ./mainmenu.sh
	fi
	sh ./AdminOver.sh
#----------------------------------------------Option 6-------------------------------------------------------------#
elif [ $userselectionA -eq "6" ]
	then
		sh ./mainmenu.sh
fi