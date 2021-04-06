

CREATE FUNCTION [dbo].[T1Query]()
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT * from dbo.Table_1
)
GO

