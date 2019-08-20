CREATE DEFINER=`root`@`localhost` PROCEDURE `LIB3_1`(IN inBranchId INT, IN newBranchName VARCHAR(55), IN newBranchAddress VARCHAR(55))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
        SELECT "An error has occurred, operation rollbacked and the stored procedure was terminated." AS Error;
	END;
      
	IF newBranchName <> 'N/A' THEN
		UPDATE tbl_library_branch
		SET branchName = newBranchName
		WHERE branchId = inBranchId;
    END IF;
    
	IF newBranchAddress <> 'N/A' THEN 
		UPDATE tbl_library_branch
		SET branchAddress = newBranchAddress
		WHERE branchId = inBranchId;
    END IF;

END