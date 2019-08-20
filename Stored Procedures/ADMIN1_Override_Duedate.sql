CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Override_Duedate`(IN inBookId INT, IN inBranchId INT, IN inCardNo INT, IN inDateOut DATETIME, IN daystoAdd INT)
BEGIN

	UPDATE tbl_book_loans 
	SET dueDate = DATE_ADD(dueDate, INTERVAL daystoAdd DAY)
	WHERE bookID = inBookId 
    AND branchId = inBranchId 
    AND cardNo = inCardNo 
    AND dateOut = inDateOut;

END