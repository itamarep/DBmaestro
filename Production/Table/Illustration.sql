CREATE TABLE [Production].[Illustration] (
    [IllustrationID] INT      IDENTITY (1, 1) NOT NULL,
    [Diagram]        XML      NULL,
    [ModifiedDate]   DATETIME NOT NULL
);


GO

ALTER TABLE [Production].[Illustration]
    ADD CONSTRAINT [DF_Illustration_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Illustration', @level2type = N'CONSTRAINT', @level2name = N'DF_Illustration_ModifiedDate';


GO





ALTER TABLE [Production].[Illustration]
    ADD CONSTRAINT [PK_Illustration_IllustrationID] PRIMARY KEY CLUSTERED ([IllustrationID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Illustration', @level2type = N'CONSTRAINT', @level2name = N'PK_Illustration_IllustrationID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bicycle assembly diagrams.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Illustration';


GO



