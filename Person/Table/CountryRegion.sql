CREATE TABLE [Person].[CountryRegion] (
    [CountryRegionCode] NVARCHAR (3) NOT NULL,
    [Name]              [dbo].[Name] NOT NULL,
    [ModifiedDate]      DATETIME     NOT NULL
);


GO

ALTER TABLE [Person].[CountryRegion]
    ADD CONSTRAINT [PK_CountryRegion_CountryRegionCode] PRIMARY KEY CLUSTERED ([CountryRegionCode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'CONSTRAINT', @level2name = N'PK_CountryRegion_CountryRegionCode';


GO





ALTER TABLE [Person].[CountryRegion]
    ADD CONSTRAINT [DF_CountryRegion_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'CONSTRAINT', @level2name = N'DF_CountryRegion_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_CountryRegion_Name]
    ON [Person].[CountryRegion]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'INDEX', @level2name = N'AK_CountryRegion_Name';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lookup table containing the ISO standard codes for countries and regions.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'CountryRegion';


GO



