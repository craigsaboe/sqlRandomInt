/**
	Description: Quick script for checking fnGetRandomInt... get lowest + highest val
	generated over x iterations. Mainly used to verify it was treating
	negative mins correctly.

	Author: Craig Saboe
	Date: 06/20/2014	
**/

DECLARE @count INT = 0
DECLARE @iterations INT = 10000

/* Upper + lower bounds for fnGetRandomInt. */ 
DECLARE @rangeMin INT = -1000
DECLARE @rangeMax INT = 1000

DECLARE @min INT = @rangeMax
DECLARE @max INT = @rangeMin
DECLARE @val INT 

WHILE (@count <= 10000)
BEGIN
	/* Get a random value between @rangeMin and @rangeMax. */
	SET @val = dbo.fnGetRandomInt(@rangeMin, @rangeMax)
	
	/* Check val against current @min and @max, and replace if necessary. */
	IF @val < @min 
		SET @min = @val
	ELSE
		IF @val > @max 
			SET @max = @val

	/* Iterate. */
	SET @count = @count + 1
END

/* Write out our max and min. */
SELECT @min, @max
GO