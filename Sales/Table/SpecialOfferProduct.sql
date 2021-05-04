CREATE TABLE [Sales].[SpecialOfferProduct] (
    [SpecialOfferID] INT              NOT NULL,
    [ProductID]      INT              NOT NULL,
    [rowguid]        UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]   DATETIME         NOT NULL
);


GO

ALTER TABLE [Sales].[SpecialOfferProduct]
    ADD CONSTRAINT [DF_SpecialOfferProduct_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOfferProduct', @level2type = N'CONSTRAINT', @level2name = N'DF_SpecialOfferProduct_ModifiedDate';


GO





ALTER TABLE [Sales].[SpecialOfferProduct]
    ADD CONSTRAINT [DF_SpecialOfferProduct_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOfferProduct', @level2type = N'CONSTRAINT', @level2name = N'DF_SpecialOfferProduct_rowguid';


GO





ALTER TABLE [Sales].[SpecialOfferProduct]
    ADD CONSTRAINT [FK_SpecialOfferProduct_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Product.ProductID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOfferProduct', @level2type = N'CONSTRAINT', @level2name = N'FK_SpecialOfferProduct_Product_ProductID';


GO





ALTER TABLE [Sales].[SpecialOfferProduct]
    ADD CONSTRAINT [FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID] FOREIGN KEY ([SpecialOfferID]) REFERENCES [Sales].[SpecialOffer] ([SpecialOfferID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing SpecialOffer.SpecialOfferID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOfferProduct', @level2type = N'CONSTRAINT', @level2name = N'FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID';


GO





ALTER TABLE [Sales].[SpecialOfferProduct]
    ADD CONSTRAINT [PK_SpecialOfferProduct_SpecialOfferID_ProductID] PRIMARY KEY CLUSTERED ([SpecialOfferID] ASC, [ProductID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOfferProduct', @level2type = N'CONSTRAINT', @level2name = N'PK_SpecialOfferProduct_SpecialOfferID_ProductID';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_SpecialOfferProduct_rowguid]
    ON [Sales].[SpecialOfferProduct]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOfferProduct', @level2type = N'INDEX', @level2name = N'AK_SpecialOfferProduct_rowguid';


GO





CREATE NONCLUSTERED INDEX [IX_SpecialOfferProduct_ProductID]
    ON [Sales].[SpecialOfferProduct]([ProductID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOfferProduct', @level2type = N'INDEX', @level2name = N'IX_SpecialOfferProduct_ProductID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-reference table mapping products to special offer discounts.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOfferProduct';


GO



