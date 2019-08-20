CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Loan`()
BEGIN
	select bookId, branchId, cardNo, dateOut, dueDate, returned, " "
    from tbl_book_loans;
END