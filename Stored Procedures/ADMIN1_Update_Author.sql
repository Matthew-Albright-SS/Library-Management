CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Update_Author`(IN inBookId INT, IN inTitle VARCHAR(45), IN inPubId INT, IN inAuthorName VARCHAR(45))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
        SELECT "An error has occurred, operation rollbacked and the stored procedure was terminated." AS Error;
	END;
	UPDATE tbl_book
	SET title = inTitle, 
		pubId = inPubId
	WHERE bookId = inBookId;
	
	UPDATE tbl_author
	JOIN tbl_book_authors
		USING(authorId)
	JOIN tbl_book
		USING(bookId)
	SET tbl_author.authorName = inAuthorName
	WHERE bookId = inBookId;
  
END