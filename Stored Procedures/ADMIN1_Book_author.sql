CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Book_author`()
BEGIN

	Select b.title, a.authorName , a.authorId, " "
    FROM tbl_book AS b
		JOIN tbl_book_authors AS ba
			ON b.bookId = ba.bookId
        JOIN tbl_author AS a
			ON ba.authorId = a.authorId;

END