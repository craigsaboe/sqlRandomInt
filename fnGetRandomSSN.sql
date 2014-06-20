/**
	Description: Generates random SSNs as a string in the format of
	"###-##-####". Does follow SOME of the rules, so they can pass 
	standard validations in	a web application.
	
	1. No group can be all zeroes
	2. First 3 have to be less than 900

	666 is not allowed in the first 3, and 987-65-432[0..9] are reserved
	for ads, but I'm obviously not checking them here, I just want test
	data.

	Author: Craig Saboe
	Date: 06/20/2014
**/

CREATE FUNCTION fnGetRandomSSN ()
RETURNS varchar(11)
AS
BEGIN
	
	-- Return the result of the function
	RETURN ( SELECT RIGHT('00' + CAST(dbo.fnGetRandomInt(1,900) as varchar), 3) + '-' + 
				RIGHT('0' + CAST(dbo.fnGetRandomInt(1,100) as varchar), 2) + '-' + 
				RIGHT('000' + CAST(dbo.fnGetRandomInt(1,10000) as varchar), 4) 
			)

END
GO

