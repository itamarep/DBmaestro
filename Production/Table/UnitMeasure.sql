CREATE TABLE [Production].[UnitMeasure] (
    [UnitMeasureCode] NCHAR (3)    NOT NULL,
    [Name]            [dbo].[Name] NOT NULL,
    [ModifiedDate]    DATETIME     NOT NULL
);


GO

ALTER TABLE [Production].[UnitMeasure]
    ADD CONSTRAINT [DF_UnitMeasure_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'UnitMeasure', @level2type = N'CONSTRAINT', @level2name = N'DF_UnitMeasure_ModifiedDate';


GO





ALTER TABLE [Production].[UnitMeasure]
    ADD CONSTRAINT [PK_UnitMeasure_UnitMeasureCode] PRIMARY KEY CLUSTERED ([UnitMeasureCode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'UnitMeasure', @level2type = N'CONSTRAINT', @level2name = N'PK_UnitMeasure_UnitMeasureCode';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_UnitMeasure_Name]
    ON [Production].[UnitMeasure]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'UnitMeasure', @level2type = N'INDEX', @level2name = N'AK_UnitMeasure_Name';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit of measure lookup table.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'UnitMeasure';


GO



