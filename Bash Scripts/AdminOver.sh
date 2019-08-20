#We are modfying the due date
    export bookId
    export branchId
    export cardId
    export dateOut
    echo "How many days would you like to extend by?"
    read days
    echo "Type YES to confirm and NO to go back [Adding $days day(s) to Book ID: $bookId]"
    read finalChoice
        if [ "$finalChoice" == "YES" ]
        then
        #This modfys the due date
        #echo "CALL ADMIN1_Override_Duedate($bookId,$branchId,$cardId,$dateOut,$days);"
        MODIFYDATE=( $( mysql -N -u root  library -e "CALL ADMIN1_Override_Duedate($bookId,$branchId,$cardId,'$dateOut',$days);" ) )
        else
            sh ./ADMIN1.sh
    fi
 # CALL BACK INTO PREVIOUS SHELL
 sh ./ADMIN1.sh