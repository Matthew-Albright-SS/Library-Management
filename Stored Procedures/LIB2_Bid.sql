CREATE DEFINER=`root`@`localhost` PROCEDURE `LIB2_Bid`(IN inBranchName VARCHAR(45), IN inBranchAddress VARCHAR(45))
BEGIN

SELECT branchId
    FROM tbl_library_branch
    WHERE branchName = inBranchName
    AND branchAddress = inBranchAddress;
 
END