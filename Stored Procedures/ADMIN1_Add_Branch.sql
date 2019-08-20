CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Add_Branch`(IN inbranchName VARCHAR(45), IN inbranchAddress VARCHAR(45))
BEGIN

	INSERT INTO tbl_library_branch (branchName, branchAddress)
	VALUES (inbranchName, inbranchAddress);

END