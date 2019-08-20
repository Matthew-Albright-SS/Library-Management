#We are adding a publisher
if [ $userselectionB -eq "1" ]
	then
    echo "Type in the new publisher name"
    read newpublisherName
    echo "Type in new publisher address"
    read newpublisherAddress
    echo "Please type in the new publisher phone number"
    read newpublisherPhone
    #Add New Publisher
	#echo "CALL ADMIN1_Add_Publisher('$newpublisherName','$newpublisherAddress', '$newpublisherPhone');" 
    ADDBOOKPUBLISHER=( $( mysql -N -u root  library -e "CALL ADMIN1_Add_Publisher('$newpublisherName','$newpublisherAddress', '$newpublisherPhone');" ) )
    echo "Publisher Added Succesfully"

#We are updating a publisher


elif [ $userselectionB -eq "2" ]
	then
    echo "Type in the new publisher name"
    read newpublisherName
    echo "Type in new publisher address"
    read newpublisherAddress
    echo "Please type in the new publisher phone number"
    read newpublisherPhone
	#echo "ADMIN1_Update_Publisher($pubId, '$newpublisherName','$newpublisherAddress', '$newpublisherPhone')" 
    UPDATEBOOKPUBLISHER=( $( mysql -N -u root  library -e "CALL ADMIN1_Update_Publisher($pubId, '$newpublisherName','$newpublisherAddress', '$newpublisherPhone');" ) )
    echo "Author and Book Updated Succesfully"

#We are deleting book and author and any connected books
elif [ $userselectionB -eq "3" ]
	then
	echo "Type YES to confirm and NO to go back [Deleting Publisher ID: $pubId]"
	read finalChoice
        if [ "$finalChoice" == "YES" ]
        then
            #This will author and all books
            #echo "ADMIN1_Delete_Author($deleteChoice, $bookId, $authorId);"
            DELETEBOOKPUBLISHER=( $( mysql -N -u root  library -e "CALL ADMIN1_Delete_Publisher($pubId);" ) )
        else
            sh ./ADMIN1.sh
    fi
fi


 # CALL BACK INTO PREVIOUS SHELL
 sh ./ADMIN1.sh