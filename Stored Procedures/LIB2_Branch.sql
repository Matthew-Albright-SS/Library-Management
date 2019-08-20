CREATE DEFINER=`root`@`localhost` PROCEDURE `LIB2_Branch`()
BEGIN

SELECT branchName, concat(branchAddress), " "
   FROM tbl_library_branch;

END