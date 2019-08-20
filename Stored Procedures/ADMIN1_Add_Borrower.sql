CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Add_Borrower`(IN inName VARCHAR(45), IN inAddress VARCHAR(45), IN inPhone VARCHAR(45))
BEGIN

	INSERT INTO tbl_borrower (name, address, phone)
	VALUES (inName, inAddress, inPhone);

END