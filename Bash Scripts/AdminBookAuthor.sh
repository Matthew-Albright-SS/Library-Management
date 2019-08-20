#We are adding a book and author
if [ $userselectionB -eq "1" ]
	then
    echo "Type in the new author name"
    read newAuthor
    echo "Type in new book title"
    read newTitle
    echo "Please type in a publisher ID from available publishers below"
    #List publisher query
    counter=$((1))
    IFS=$'\n' ARRAYVAR=( $( mysql -N -u root  library -e "CALL ADMIN1_Publisher_Id;" ) )
		for i in "${ARRAYVAR[@]}"
			do
				IFS=$'\t' read -r col1 col2 <<< "$i"
				echo "$counter)  $col1 Pub ID: $col2"
				counter=$(($counter+1))
			done
		echo "$counter)  Quit to previous"
    read publisherSelection
	#echo "CALL ADMIN1_Add_Author('$newTitle', $publisherSelection, '$newAuthor');" 
    ADDBOOKAUTHOR=( $( mysql -N -u root  library -e "CALL ADMIN1_Add_Author('$newTitle', $publisherSelection, '$newAuthor');" ) )
    echo "Author and Book Added Succesfully"


#We are updating book and author
elif [ $userselectionB -eq "2" ]
	then
    echo "Type in the new author name"
    read newAuthor
    echo "Type in new book title"
    read newTitle
    echo "Please type in a publisher ID from available publishers below"
    #List publisher query
    counter=$((1))
    IFS=$'\n' ARRAYVAR=( $( mysql -N -u root  library -e "CALL ADMIN1_Publisher_Id;" ) )
		for i in "${ARRAYVAR[@]}"
			do
				IFS=$'\t' read -r col1 col2 <<< "$i"
				echo "$counter)  $col1 Pub ID: $col2"
				counter=$(($counter+1))
			done
		echo "$counter)  Quit to previous"
    read publisherSelection
	#echo "CALL ADMIN1_Update_Author($bookId, '$newTitle', $publisherSelection, '$newAuthor')" 
    UPDATEBOOKAUTHOR=( $( mysql -N -u root  library -e "CALL ADMIN1_Update_Author($bookId, '$newTitle', $publisherSelection, '$newAuthor');" ) )
    echo "Author and Book Updated Succesfully"

#We are deleting book and author and any connected books
elif [ $userselectionB -eq "3" ]
	then
	echo "Would you like to delete the book or the author? Type 1 for book and 2 for author"
	read deleteChoice
	if [ $deleteChoice -eq "1" ]
		then
			#This will just delete the book
			DELETEBOOKAUTHOR=( $( mysql -N -u root  library -e "CALL ADMIN1_Delete_Author($deleteChoice, $bookId, 0);" ) )
    
    else
    	echo "You selected delete Author (Warning this will delete all connected books)"
    	echo "Type YES to confirm and NO to go back"
    	read finalChoice
    	if [ "$finalChoice" == "YES" ]
		then
			#This will author and all books
			#echo "ADMIN1_Delete_Author($deleteChoice, $bookId, $authorId);"
			DELETEBOOKAUTHOR=( $( mysql -N -u root  library -e "CALL ADMIN1_Delete_Author($deleteChoice, $bookId, $authorId);" ) )
    	else
    		sh ./ADMIN1.sh
    	
    fi
    fi
fi


 # CALL BACK INTO PREVIOUS SHELL
 sh ./ADMIN1.sh