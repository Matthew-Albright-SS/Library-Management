CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Delete_Author`(IN deleteChoice INT, IN inBookId INT, IN inAuthorId INT)
BEGIN

 IF deleteChoice = 1 THEN
 
	DELETE FROM tbl_book_genres 
	WHERE bookId = inBookId;

	DELETE FROM tbl_book_authors 
	WHERE bookId = inBookId;
 
	DELETE FROM tbl_book
	WHERE bookId = inBookId;
	
ELSEIF deleteChoice = 2 THEN

	CREATE TEMPORARY TABLE savedBookIds select bookId
	FROM tbl_book
		JOIN tbl_book_authors 
			USING(bookId)
		JOIN tbl_author
			USING(authorId)
	WHERE tbl_author.authorId = inAuthorId;
	
	DELETE FROM tbl_book_authors
	WHERE authorId = inauthorId;
			
	DELETE FROM tbl_author
	WHERE authorId = inauthorId;
	
	DELETE tbl_book_genres 
	FROM tbl_book_genres
	JOIN savedBookIds
		USING(bookId);
	
	DELETE tbl_book 
	FROM tbl_book
	JOIN savedBookIds
		USING(bookId);
	
	DROP TABLE savedBookIds;
END IF;

END