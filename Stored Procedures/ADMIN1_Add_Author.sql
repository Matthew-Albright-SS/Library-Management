CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Add_Author`(IN inTitle VARCHAR(45), IN inpubId INT, IN inAuthorName VARCHAR(45))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
        SELECT "An error has occurred, operation rollbacked and the stored procedure was terminated." AS Error;
	END;
	INSERT INTO tbl_book (title, pubId)
	VALUES (inTitle, inpubId);
    
    INSERT INTO tbl_author(authorName)
    VALUES (inauthorName);

	INSERT INTO tbl_book_authors
    VALUES ((SELECT bookId FROM tbl_book WHERE title = inTitle ORDER BY bookId DESC LIMIT 1), 
		(SELECT authorId FROM tbl_author WHERE authorName = inAuthorName ORDER BY authorId DESC LIMIT 1));
  
END