CREATE TABLE [Sales].[Store] (
    [BusinessEntityID] INT                                                NOT NULL,
    [Name]             [dbo].[Name]                                       NOT NULL,
    [SalesPersonID]    INT                                                NULL,
    [Demographics]     XML(CONTENT [Sales].[StoreSurveySchemaCollection]) NULL,
    [rowguid]          UNIQUEIDENTIFIER                                   ROWGUIDCOL NOT NULL,
    [ModifiedDate]     DATETIME                                           NOT NULL
);


GO

ALTER TABLE [Sales].[Store]
    ADD CONSTRAINT [PK_Store_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store', @level2type = N'CONSTRAINT', @level2name = N'PK_Store_BusinessEntityID';


GO





ALTER TABLE [Sales].[Store]
    ADD CONSTRAINT [FK_Store_BusinessEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing BusinessEntity.BusinessEntityID', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store', @level2type = N'CONSTRAINT', @level2name = N'FK_Store_BusinessEntity_BusinessEntityID';


GO





ALTER TABLE [Sales].[Store]
    ADD CONSTRAINT [FK_Store_SalesPerson_SalesPersonID] FOREIGN KEY ([SalesPersonID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing SalesPerson.SalesPersonID', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store', @level2type = N'CONSTRAINT', @level2name = N'FK_Store_SalesPerson_SalesPersonID';


GO





ALTER TABLE [Sales].[Store]
    ADD CONSTRAINT [DF_Store_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store', @level2type = N'CONSTRAINT', @level2name = N'DF_Store_ModifiedDate';


GO





ALTER TABLE [Sales].[Store]
    ADD CONSTRAINT [DF_Store_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store', @level2type = N'CONSTRAINT', @level2name = N'DF_Store_rowguid';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Store_rowguid]
    ON [Sales].[Store]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store', @level2type = N'INDEX', @level2name = N'AK_Store_rowguid';


GO





CREATE NONCLUSTERED INDEX [IX_Store_SalesPersonID]
    ON [Sales].[Store]([SalesPersonID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store', @level2type = N'INDEX', @level2name = N'IX_Store_SalesPersonID';


GO





CREATE PRIMARY XML INDEX [PXML_Store_Demographics]
    ON [Sales].[Store]([Demographics])
    WITH (PAD_INDEX = OFF);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary XML index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store', @level2type = N'INDEX', @level2name = N'PXML_Store_Demographics';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customers (resellers) of Adventure Works products.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store';


GO



