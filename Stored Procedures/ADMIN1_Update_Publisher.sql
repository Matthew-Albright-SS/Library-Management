CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Update_Publisher`(IN inPublisherId INT, IN inPublisherName VARCHAR(45), IN inPublisherAddress VARCHAR(45), IN inPublisherPhone VARCHAR(45))
BEGIN

	UPDATE tbl_publisher
	SET publisherName = inPublisherName, 
		publisherAddress = inPublisherAddress, 
        publisherPhone = inPublisherPhone
	WHERE publisherId = inPublisherId;

END