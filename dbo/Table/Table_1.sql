CREATE TABLE [dbo].[Table_1] (
    [c1] NCHAR (10) NOT NULL,
    [c2] NCHAR (10) NULL,
    [c3] NCHAR (10) NULL
);


GO

ALTER TABLE [dbo].[Table_1]
    ADD CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED ([c1] ASC);


GO



