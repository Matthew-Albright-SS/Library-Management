#!/bin/bash
#This Script Handles Librarian Function
#This Script Will Allow the User to Modify Book Copies
IFS=$'\n' COPIES=( $( mysql -N -u root  library -e "CALL LIB3_Copies('$bookTitle','$bookAuthor', $bId);" ) )

#Pull in Book Id Data
IFS=$'\n' BOOKID=( $( mysql -N -u root  library -e "CALL LIB3_bookId('$bookTitle');" ) )

echo "Existing number of copies: ${COPIES[0]}"
echo "Enter new number of copies:"
read  newCopies
UPDATE=( $( mysql -N -u root  library -e "CALL LIB3_2(${BOOKID[0]},$bId,$newCopies)" ) )
IFS=$'\n' NCOPIES=( $( mysql -N -u root  library -e "CALL LIB3_Copies('$bookTitle','$bookAuthor', $bId);" ) )
echo "New number of copies: ${NCOPIES[0]}"
sh ./LIB3_Branch.sh