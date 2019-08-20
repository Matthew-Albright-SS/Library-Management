#We are adding a borrower
if [ $userselectionB -eq "1" ]
	then
    echo "Type in the new borrower name"
    read newborrowerName
    echo "Type in new borrower address"
    read newborrowerAddress
    echo "Type in the new borrower phone number"
    read newborrowerPhone
    #Add New borrower
	#echo "ADMIN1_Add_Borrower($newborrowerName,$newborrowerAddress,$newborrowerPhone);" 
    ADDBORROWER=( $( mysql -N -u root  library -e "CALL ADMIN1_Add_Borrower('$newborrowerName','$newborrowerAddress','$newborrowerPhone');" ) )
    echo "Borrower Added Succesfully"

#We are updating a borrower
elif [ $userselectionB -eq "2" ]
	then
    echo "Type in the new borrower name"
    read newborrowerName
    echo "Type in new borrower address"
    read newborrowerAddress
    echo "Type in the new borrower phone number"
    read newborrowerPhone
    #Update Borrower
    UPDATEBORROWER=( $( mysql -N -u root  library -e "CALL ADMIN1_Update_Borrower($borrowerId, '$newborrowerName','$newborrowerAddress','$newborrowerPhone');" ) )
    echo "Borrower Updated Succesfully"

#We are deleting borrower
elif [ $userselectionB -eq "3" ]
	then
	echo "Type YES to confirm and NO to go back [Deleting Borrower ID: $borrowerId]"
	read finalChoice
        if [ "$finalChoice" == "YES" ]
        then
            #This remove borrower and related info
            DELETEBRANCH=( $( mysql -N -u root  library -e "CALL ADMIN1_Delete_Borrower($borrowerId);" ) )
        else
            sh ./ADMIN1.sh
    fi
fi


 # CALL BACK INTO PREVIOUS SHELL
 sh ./ADMIN1.sh