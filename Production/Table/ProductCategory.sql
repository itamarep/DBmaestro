CREATE TABLE [Production].[ProductCategory] (
    [ProductCategoryID] INT              IDENTITY (1, 1) NOT NULL,
    [Name]              [dbo].[Name]     NOT NULL,
    [rowguid]           UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]      DATETIME         NOT NULL
);


GO

ALTER TABLE [Production].[ProductCategory]
    ADD CONSTRAINT [DF_ProductCategory_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCategory', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductCategory_ModifiedDate';


GO





ALTER TABLE [Production].[ProductCategory]
    ADD CONSTRAINT [DF_ProductCategory_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCategory', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductCategory_rowguid';


GO





ALTER TABLE [Production].[ProductCategory]
    ADD CONSTRAINT [PK_ProductCategory_ProductCategoryID] PRIMARY KEY CLUSTERED ([ProductCategoryID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCategory', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductCategory_ProductCategoryID';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductCategory_Name]
    ON [Production].[ProductCategory]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCategory', @level2type = N'INDEX', @level2name = N'AK_ProductCategory_Name';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductCategory_rowguid]
    ON [Production].[ProductCategory]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCategory', @level2type = N'INDEX', @level2name = N'AK_ProductCategory_rowguid';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'High-level product categorization.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCategory';


GO



