CREATE DEFINER=`root`@`localhost` PROCEDURE `BORR1`(IN inCardNo INT)
BEGIN
	DECLARE isValid INT;
    SET isValid = 0;
	SELECT 1 INTO isValid
    FROM tbl_borrower AS b
    WHERE cardNo = inCardNo;
    SELECT isValid;

END