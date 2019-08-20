CREATE DEFINER=`root`@`localhost` PROCEDURE `LIB3_Copies`(IN inBookTitle VARCHAR(45), IN inBookAuthor VARCHAR(45), IN inBranchId INT)
BEGIN
	Select noOfCopies
	FROM tbl_book_copies AS bc
		JOIN tbl_book AS b
			USING (bookId)
		JOIN tbl_book_authors AS ba
			USING (bookId)
		JOIN tbl_author AS a
			USING (authorId)
	WHERE bc.branchId = inBranchId
    AND b.title = inBookTitle
    AND a.authorName = inBookAuthor;
            
END