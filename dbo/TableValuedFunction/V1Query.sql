
CREATE FUNCTION [dbo].[V1Query]()
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT c1 from dbo.View_1
)
GO

