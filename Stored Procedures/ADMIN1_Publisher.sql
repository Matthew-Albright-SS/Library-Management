CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Publisher`()
BEGIN
	select publisherName, publisherId, " "
    from tbl_publisher;
END