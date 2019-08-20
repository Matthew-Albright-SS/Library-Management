#!/bin/bash
#This Script Handles LIB2 List Library Branches with Names and Locations
echo "Please Type in the number of the branch you would like to update:"
IFS=$'\n' ARRAYVAR=( $( mysql -N -u root  library -e "CALL LIB2_Branch;" ) )
counter=$((1))
userselection=$((1))
for i in "${ARRAYVAR[@]}"
	do
		IFS=$'\t' read -r col1 col2 <<< "$i"
		#IFS=$'\t' LIBS=( "$col1" )
		echo "$counter)  $col1, $col2"
		counter=$(($counter+1))
	done
echo "$counter)  Quit to previous"
read userselection
if [ $userselection -eq "$counter" ]
	then
		sh ./LIB1.sh
fi
#Pull in the Branch ID
IFS=$'\t' read -a nameadd <<< "${ARRAYVAR[$(($userselection-1))]}"
IFS=$'\n' BRANCHID=( $( mysql -N -u root  library -e "CALL LIB2_Bid('${nameadd[0]}','${nameadd[1]}');" ) )
bId=${BRANCHID[0]}
bName=${nameadd[0]}
export bName
export bId
sh ./LIB3_Branch.sh