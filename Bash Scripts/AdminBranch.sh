#We are adding a branch
if [ $userselectionB -eq "1" ]
	then
    echo "Type in the new branch name"
    read newbranchName
    echo "Type in new branch address"
    read newbranchAddress
    #Add New branch
	#echo "CALL ADMIN1_Add_Publisher('$newbranchName','$newbranchAddress');" 
    ADDBRANCH=( $( mysql -N -u root  library -e "CALL ADMIN1_Add_Branch('$newbranchName','$newbranchAddress');" ) )
    echo "Branch Added Succesfully"

#We are updating a branch
elif [ $userselectionB -eq "2" ]
	then
    echo "Type in the new branch name"
    read newbranchName
    echo "Type in new branch address"
    read newbranchAddress
    #Update branch
	#echo "CALL ADMIN1_Update_Branch($branchId, '$newbranchName','$newbranchAddress');" 
    UPDATEBRANCH=( $( mysql -N -u root  library -e "CALL ADMIN1_Update_Branch($branchId, '$newbranchName','$newbranchAddress');" ) )
    echo "Branch Updated Succesfully"

#We are deleting branch
elif [ $userselectionB -eq "3" ]
	then
	echo "Type YES to confirm and NO to go back [Deleting Branch ID: $branchId]"
	read finalChoice
        if [ "$finalChoice" == "YES" ]
        then
            #This remove branch and related info
            #echo "ADMIN1_Delete_Branch($branchId);"
            DELETEBRANCH=( $( mysql -N -u root  library -e "CALL ADMIN1_Delete_Branch($branchId);" ) )
        else
            sh ./ADMIN1.sh
    fi
fi


 # CALL BACK INTO PREVIOUS SHELL
 sh ./ADMIN1.sh