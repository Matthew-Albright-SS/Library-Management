CREATE DEFINER=`root`@`localhost` PROCEDURE `LIB2_Book`(IN inBranchId INT)
BEGIN
	SELECT b.title, a.authorName, " "
    FROM tbl_book AS b
		JOIN tbl_book_copies AS bc
			ON b.bookId = bc.bookId
            AND bc.branchId = inBranchId
		JOIN tbl_book_authors AS ba
			ON bc.bookId = ba.bookId
        JOIN tbl_author AS a
			ON ba.authorId = a.authorId;
END