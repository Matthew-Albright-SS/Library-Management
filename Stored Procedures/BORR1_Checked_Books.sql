CREATE DEFINER=`root`@`localhost` PROCEDURE `BORR1_Checked_Books`(IN inBranchId INT, IN inCardNo INT)
BEGIN

	Select b.title, a.authorName
	FROM tbl_book_loans AS bl
		JOIN tbl_book_copies AS bc
			ON bl.bookId = bc.bookId
            AND bl.branchId = inBranchId
            AND bl.cardNo = inCardNo
            AND bl.returned IS NULL
		JOIN tbl_book AS b
			ON bc.bookId = b.bookId
		JOIN tbl_book_authors AS ba
			ON b.bookId = ba.bookId
        JOIN tbl_author AS a
			ON ba.authorId = a.authorId;
END