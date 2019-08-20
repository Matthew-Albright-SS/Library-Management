CREATE DEFINER=`root`@`localhost` PROCEDURE `ADMIN1_Branch`()
BEGIN
	select branchName, branchId, " "
    from tbl_library_branch;
END