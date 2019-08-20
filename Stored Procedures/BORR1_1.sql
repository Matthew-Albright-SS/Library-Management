CREATE DEFINER=`root`@`localhost` PROCEDURE `BORR1_1`(IN inBookId INT, IN inBranchId INT, IN inCardNo INT)
BEGIN

-- Declared Vars
DECLARE numberCopies int;
DECLARE msg varchar(255); 
DECLARE tooFast int DEFAULT 0;

DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS Error;
	END;

SELECT 1 INTO tooFast
FROM tbl_book_loans
WHERE bookId = inBookId
	AND branchId = inBranchId
	AND cardNo = inCardNo
	AND dateOut = now()
	AND returned IS NOT NULL;

IF tooFast = 1 THEN
	SET msg = 'Slow down, your queries are too fast!' ;
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg; 
END IF;

SELECT noOfCopies INTO numberCopies
FROM tbl_book_copies
WHERE bookId = inBookId
AND branchId = inBranchId;

IF numberCopies > 0 THEN
    INSERT INTO tbl_book_loans (bookId, branchId, cardNo, dateOut, dueDate)
	VALUES (inBookId, inBranchId, inCardNo, NOW(), CURDATE() + 7);
	
UPDATE tbl_book_copies
    SET noOfCopies = noOfCopies - 1
    WHERE bookId = inBookId
    AND branchId = inBranchId;
ELSE
	SET msg = 'Not enough copies of that book at that branch!' ;
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg; 
 
END IF;
END