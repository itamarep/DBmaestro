
CREATE FUNCTION [dbo].[V1Query]()
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT * from dbo.View_1
)
GO

