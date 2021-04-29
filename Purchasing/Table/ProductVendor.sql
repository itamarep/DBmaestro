CREATE TABLE [Purchasing].[ProductVendor] (
    [ProductID]        INT       NOT NULL,
    [BusinessEntityID] INT       NOT NULL,
    [AverageLeadTime]  INT       NOT NULL,
    [StandardPrice]    MONEY     NOT NULL,
    [LastReceiptCost]  MONEY     NULL,
    [LastReceiptDate]  DATETIME  NULL,
    [MinOrderQty]      INT       NOT NULL,
    [MaxOrderQty]      INT       NOT NULL,
    [OnOrderQty]       INT       NULL,
    [UnitMeasureCode]  NCHAR (3) NOT NULL,
    [ModifiedDate]     DATETIME  NOT NULL
);


GO

ALTER TABLE [Purchasing].[ProductVendor]
    ADD CONSTRAINT [PK_ProductVendor_ProductID_BusinessEntityID] PRIMARY KEY CLUSTERED ([ProductID] ASC, [BusinessEntityID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'ProductVendor', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductVendor_ProductID_BusinessEntityID';


GO





ALTER TABLE [Purchasing].[ProductVendor]
    ADD CONSTRAINT [FK_ProductVendor_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Product.ProductID.', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'ProductVendor', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductVendor_Product_ProductID';


GO





ALTER TABLE [Purchasing].[ProductVendor]
    ADD CONSTRAINT [FK_ProductVendor_UnitMeasure_UnitMeasureCode] FOREIGN KEY ([UnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing UnitMeasure.UnitMeasureCode.', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'ProductVendor', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductVendor_UnitMeasure_UnitMeasureCode';


GO





ALTER TABLE [Purchasing].[ProductVendor]
    ADD CONSTRAINT [FK_ProductVendor_Vendor_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Purchasing].[Vendor] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Vendor.BusinessEntityID.', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'ProductVendor', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductVendor_Vendor_BusinessEntityID';


GO





ALTER TABLE [Purchasing].[ProductVendor]
    ADD CONSTRAINT [DF_ProductVendor_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'ProductVendor', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductVendor_ModifiedDate';


GO





ALTER TABLE [Purchasing].[ProductVendor]
    ADD CONSTRAINT [CK_ProductVendor_AverageLeadTime] CHECK ([AverageLeadTime]>=(1));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [AverageLeadTime] >= (1)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'ProductVendor', @level2type = N'CONSTRAINT', @level2name = N'CK_ProductVendor_AverageLeadTime';


GO





ALTER TABLE [Purchasing].[ProductVendor]
    ADD CONSTRAINT [CK_ProductVendor_StandardPrice] CHECK ([StandardPrice]>(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [StandardPrice] > (0.00)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'ProductVendor', @level2type = N'CONSTRAINT', @level2name = N'CK_ProductVendor_StandardPrice';


GO





ALTER TABLE [Purchasing].[ProductVendor]
    ADD CONSTRAINT [CK_ProductVendor_LastReceiptCost] CHECK ([LastReceiptCost]>(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [LastReceiptCost] > (0.00)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'ProductVendor', @level2type = N'CONSTRAINT', @level2name = N'CK_ProductVendor_LastReceiptCost';


GO





ALTER TABLE [Purchasing].[ProductVendor]
    ADD CONSTRAINT [CK_ProductVendor_MinOrderQty] CHECK ([MinOrderQty]>=(1));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [MinOrderQty] >= (1)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'ProductVendor', @level2type = N'CONSTRAINT', @level2name = N'CK_ProductVendor_MinOrderQty';


GO





ALTER TABLE [Purchasing].[ProductVendor]
    ADD CONSTRAINT [CK_ProductVendor_MaxOrderQty] CHECK ([MaxOrderQty]>=(1));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [MaxOrderQty] >= (1)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'ProductVendor', @level2type = N'CONSTRAINT', @level2name = N'CK_ProductVendor_MaxOrderQty';


GO





ALTER TABLE [Purchasing].[ProductVendor]
    ADD CONSTRAINT [CK_ProductVendor_OnOrderQty] CHECK ([OnOrderQty]>=(0));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [OnOrderQty] >= (0)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'ProductVendor', @level2type = N'CONSTRAINT', @level2name = N'CK_ProductVendor_OnOrderQty';


GO





CREATE NONCLUSTERED INDEX [IX_ProductVendor_UnitMeasureCode]
    ON [Purchasing].[ProductVendor]([UnitMeasureCode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'ProductVendor', @level2type = N'INDEX', @level2name = N'IX_ProductVendor_UnitMeasureCode';


GO





CREATE NONCLUSTERED INDEX [IX_ProductVendor_BusinessEntityID]
    ON [Purchasing].[ProductVendor]([BusinessEntityID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'ProductVendor', @level2type = N'INDEX', @level2name = N'IX_ProductVendor_BusinessEntityID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-reference table mapping vendors with the products they supply.', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'ProductVendor';


GO



