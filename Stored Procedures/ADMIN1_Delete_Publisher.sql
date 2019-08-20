CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Delete_Publisher`(IN inPublisherId INT)
BEGIN
	DECLARE BID INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
        SELECT "An error has occurred, operation rollbacked and the stored procedure was terminated." AS Error;
	END;
    SELECT bookId INTO BID FROM tbl_book WHERE pubId = inPublisherId;
	DELETE FROM tbl_book_authors 
    WHERE bookId = BID;
    DELETE FROM tbl_book_genres 
    WHERE bookId =  BID;
    DELETE FROM tbl_book_copies 
    WHERE bookId =  BID;
    DELETE FROM tbl_book_loans 
    WHERE bookId =  BID;
    DELETE FROM tbl_book
    WHERE pubId = inPublisherId;
	DELETE FROM tbl_publisher 
    WHERE publisherId = inPublisherId;

END