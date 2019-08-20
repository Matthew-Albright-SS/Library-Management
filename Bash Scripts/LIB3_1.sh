#!/bin/bash
#This Script Handles Librarian Function
#This Script Will Allow the User to Modify Library Branches
echo "Please enter new branch name or enter N/A for no change:"

#Take in new Branch Name
read newBranchName
if [ "$newBranchName" == "quit" ]
			then
				sh ./LIB3_Branch.sh
elif [ "$newBranchName" == "N/A" ]
	then
		echo "No Changes Made."
fi

#Take in new branch address
echo "Please enter new branch address or enter N/A for no change:"
read BranchAddress
if [ "$BranchAddress" == "quit" ]
			then
				sh ./LIB3_Branch.sh
elif [ "$newBranchName" == "N/A" ]
	then
		echo "No Changes Made."
fi

#This will Update the Data in the Database
UPDATE=( $( mysql -N -u root  library -e "CALL LIB3_1($bId,'$newBranchName','$BranchAddress');" ) )
echo "The details for this branch were succesfully updated. Returning to previous menu..."
sh ./LIB3_Branch.sh