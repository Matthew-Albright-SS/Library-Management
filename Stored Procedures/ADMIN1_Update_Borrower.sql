CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Update_Borrower`(IN inCardNumber INT, IN inName VARCHAR(45), IN inAddress VARCHAR(45), IN inPhone VARCHAR(45))
BEGIN

	UPDATE tbl_borrower
	SET name = inName, 
		address = inAddress, 
        phone = inPhone
	WHERE cardNo = inCardNumber;

END