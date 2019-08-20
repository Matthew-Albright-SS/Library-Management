CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Update_Branch`(IN inbranchId INT, IN inbranchName VARCHAR(45), IN inbranchAddress VARCHAR(45))
BEGIN

UPDATE tbl_library_branch
		SET branchName = inbranchName, 
			branchAddress = inbranchAddress
		WHERE branchId = inbranchId;
END