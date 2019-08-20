CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Publisher_Id`()
BEGIN
	select publisherName, publisherId,  " "
    from tbl_publisher;
END