CREATE TABLE [Person].[StateProvince] (
    [StateProvinceID]         INT              IDENTITY (1, 1) NOT NULL,
    [StateProvinceCode]       NCHAR (3)        NOT NULL,
    [CountryRegionCode]       NVARCHAR (3)     NOT NULL,
    [IsOnlyStateProvinceFlag] [dbo].[Flag]     NOT NULL,
    [Name]                    [dbo].[Name]     NOT NULL,
    [TerritoryID]             INT              NOT NULL,
    [rowguid]                 UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]            DATETIME         NOT NULL
);


GO

ALTER TABLE [Person].[StateProvince]
    ADD CONSTRAINT [DF_StateProvince_IsOnlyStateProvinceFlag] DEFAULT ((1)) FOR [IsOnlyStateProvinceFlag];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 1 (TRUE)', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'CONSTRAINT', @level2name = N'DF_StateProvince_IsOnlyStateProvinceFlag';


GO





ALTER TABLE [Person].[StateProvince]
    ADD CONSTRAINT [DF_StateProvince_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'CONSTRAINT', @level2name = N'DF_StateProvince_ModifiedDate';


GO





ALTER TABLE [Person].[StateProvince]
    ADD CONSTRAINT [DF_StateProvince_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'CONSTRAINT', @level2name = N'DF_StateProvince_rowguid';


GO





ALTER TABLE [Person].[StateProvince]
    ADD CONSTRAINT [FK_StateProvince_CountryRegion_CountryRegionCode] FOREIGN KEY ([CountryRegionCode]) REFERENCES [Person].[CountryRegion] ([CountryRegionCode]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing CountryRegion.CountryRegionCode.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'CONSTRAINT', @level2name = N'FK_StateProvince_CountryRegion_CountryRegionCode';


GO





ALTER TABLE [Person].[StateProvince]
    ADD CONSTRAINT [FK_StateProvince_SalesTerritory_TerritoryID] FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing SalesTerritory.TerritoryID.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'CONSTRAINT', @level2name = N'FK_StateProvince_SalesTerritory_TerritoryID';


GO





ALTER TABLE [Person].[StateProvince]
    ADD CONSTRAINT [PK_StateProvince_StateProvinceID] PRIMARY KEY CLUSTERED ([StateProvinceID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'CONSTRAINT', @level2name = N'PK_StateProvince_StateProvinceID';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_StateProvince_Name]
    ON [Person].[StateProvince]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'INDEX', @level2name = N'AK_StateProvince_Name';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_StateProvince_rowguid]
    ON [Person].[StateProvince]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'INDEX', @level2name = N'AK_StateProvince_rowguid';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_StateProvince_StateProvinceCode_CountryRegionCode]
    ON [Person].[StateProvince]([StateProvinceCode] ASC, [CountryRegionCode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'INDEX', @level2name = N'AK_StateProvince_StateProvinceCode_CountryRegionCode';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'State and province lookup table.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince';


GO



