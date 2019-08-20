CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Borrower`()
BEGIN
	select name, cardNo, " "
    from tbl_borrower;
END