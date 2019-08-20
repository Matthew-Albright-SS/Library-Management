CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Delete_Borrower`(IN inCardNumber INT)
BEGIN

	DELETE FROM tbl_book_loans
    WHERE cardNo = inCardNumber;
	DELETE FROM tbl_borrower
    WHERE cardNo = inCardNumber;

END