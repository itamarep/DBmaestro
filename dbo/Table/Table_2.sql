CREATE TABLE [dbo].[Table_2] (
    [c1] NCHAR (10) NOT NULL,
    [c2] NCHAR (10) NULL,
    [c3] NCHAR (10) NULL,
    [c4] NCHAR (10) NULL
);


GO

ALTER TABLE [dbo].[Table_2]
    ADD CONSTRAINT [PK_Table_2] PRIMARY KEY CLUSTERED ([c1] ASC);


GO



ALTER TABLE [dbo].[Table_2]
    ADD CONSTRAINT [FK_Table_2_Table_1] FOREIGN KEY ([c3]) REFERENCES [dbo].[Table_1] ([c1]);


GO



