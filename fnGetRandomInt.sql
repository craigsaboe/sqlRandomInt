/**
	Object: fnGetRandomInt

	Description: Returns an integer randomly selected from the range between MinValue and
	MaxValue. Uses vwRandomInt to get a starting value between 0 and MaxInt (2^31-1).
	
	Author:	Craig Saboe
	Date: 06/18/2014
**/

CREATE FUNCTION [fnGetRandomInt] 
(
	@MinValue int,
	@MaxValue int
)
RETURNS int
AS
BEGIN
	
	DECLARE @RandomInt int
	DECLARE @Range int

	/* Get the allowable range of values, to accomodate min values <> 0. If our min value
	   is > 0, we have fewer integers we can return, and vice versa. */
	SET @Range = @MaxValue - @MinValue
	
	/* Get random integer from vwRandomInt, from 0 to 2^31-1 */
	SELECT @RandomInt = RandomInt FROM vwRandomInt
	
	/* Use modulus division to get a remainder between 0 and @Range-1. */
	SET @RandomInt = @RandomInt % @Range

	/* Add back in that @MinValue and return. If @MinValue is negative, and ABS(@MinValue) > @RandomInt,
	   we'll return a negative value. */
	RETURN(SELECT @RandomInt + @MinValue)

END

