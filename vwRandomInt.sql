/**
	Object: vwRandomInt

	Description: Generates a random integer value between 0 and 2**31-1 (MaxInt).
	Calls to NEWID() and RAND() are "side-effect" functions, and so calls to them
	need to done like this - i.e. encapsulated in a view. Using NEWID() seems to be
	preferred to using RAND().

	Author:	Craig Saboe
	Date: 6/18/2014
**/

CREATE VIEW [vwRandomInt] AS
	SELECT ABS(CHECKSUM(NEWID())) as RandomInt
GO


