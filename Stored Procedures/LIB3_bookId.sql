CREATE DEFINER=`root`@`localhost` PROCEDURE `LIB3_bookId`(IN inbookTitle VARCHAR(45))
BEGIN
SELECT bookId FROM tbl_book
WHERE title = inbookTitle;
END