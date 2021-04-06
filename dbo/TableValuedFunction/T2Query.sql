

CREATE FUNCTION [dbo].[T2Query]()
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT * from dbo.Table_2
)
GO

