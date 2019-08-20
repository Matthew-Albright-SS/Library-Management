CREATE DEFINER=`root`@`localhost` PROCEDURE `LIB3_2`(IN inBookId INT, IN inBranchId INT, IN newNumCopies INT)
BEGIN
	UPDATE tbl_book_copies
	SET noOfCopies = newNumCopies
	WHERE inBookId = bookId
    AND branchId = inBranchId;
END