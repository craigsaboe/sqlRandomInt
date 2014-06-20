/**
	Description: Returns a random date that is within @DayRange days before or after 
	@OriginDate. Meant to obfuscate a date while not moving it out of an expected range.
	Uses fnGetRandomInt to generate the random number of days to adjust @OriginalDate by.
	
	Author:	Craig Saboe
	Date: 06/18/2014
**/
CREATE FUNCTION [fnRandomizeDate] 
(
	@OriginalDate datetime,
	@DayRange int
)
RETURNS datetime
AS
BEGIN
	DECLARE @addedDays int

	/* Get a random number of days to adjust the @OriginalDate by, from -(@DayRange)
	   to @DayRange. */
	SET @addedDays = dbo.fnGetRandomInt(0 - @DayRange, @DayRange)

	/* Use DATEADD to add @addedDays to our original date. If @addedDays is negative, it
	   just moves the date back in time. */
	RETURN(SELECT DATEADD(day, @addedDays, @OriginalDate))
END
GO


