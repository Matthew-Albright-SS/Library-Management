CREATE DEFINER=`root`@`localhost` PROCEDURE `BORR1_2`(IN inBookId INT, IN inBranchId INT, IN inCardNo INT, IN numberToReturn INT)
BEGIN

DECLARE msg varchar(255);
DECLARE bookCopies int;
DECLARE numToReturn int;

DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS Error;
	END;

SELECT COUNT(*) INTO bookCopies 
	FROM tbl_book_loans
	WHERE cardNo = inCardNo 
		AND bookId = inBookId
        AND branchId = inBranchId
		AND returned IS NULL
	GROUP BY cardNo;

IF numberToReturn > bookCopies THEN
	SET msg = 'You don’t have that many copies to return!';
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
END IF;

	UPDATE tbl_book_copies
		SET noOfCopies = noOfCopies + numberToReturn 
		WHERE bookId = inBookId
		AND branchId = inBranchId;

	UPDATE tbl_book_loans 
		SET returned = NOW()
		WHERE bookId = inBookId
        AND branchId = inBranchId
        AND cardNo = inCardNo
        AND returned IS NULL
        LIMIT numberToReturn;
        SELECT 1;
END