CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Add_Publisher`(IN inPublisherName VARCHAR(45), IN inPublisherAddress VARCHAR(45), IN inPublisherPhone VARCHAR(45))
BEGIN

	INSERT INTO tbl_publisher (publisherName, publisherAddress, publisherPhone)
	VALUES (inPublisherName, inPublisherAddress, inPublisherPhone);

END