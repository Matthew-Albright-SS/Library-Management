CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Delete_Branch`(IN inbranchId INT)
BEGIN
        
	DELETE FROM tbl_book_loans 
    WHERE branchId = inbranchId;
	DELETE FROM tbl_book_copies 
    WHERE branchId = inbranchId;
	DELETE FROM tbl_library_branch 
    WHERE branchId = inbranchId;
    
END