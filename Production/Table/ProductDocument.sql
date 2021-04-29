CREATE TABLE [Production].[ProductDocument] (
    [ProductID]    INT                 NOT NULL,
    [DocumentNode] [sys].[hierarchyid] NOT NULL,
    [ModifiedDate] DATETIME            NOT NULL
);


GO

ALTER TABLE [Production].[ProductDocument]
    ADD CONSTRAINT [PK_ProductDocument_ProductID_DocumentNode] PRIMARY KEY CLUSTERED ([ProductID] ASC, [DocumentNode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductDocument', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductDocument_ProductID_DocumentNode';


GO





ALTER TABLE [Production].[ProductDocument]
    ADD CONSTRAINT [FK_ProductDocument_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Product.ProductID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductDocument', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductDocument_Product_ProductID';


GO





ALTER TABLE [Production].[ProductDocument]
    ADD CONSTRAINT [FK_ProductDocument_Document_DocumentNode] FOREIGN KEY ([DocumentNode]) REFERENCES [Production].[Document] ([DocumentNode]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Document.DocumentNode.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductDocument', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductDocument_Document_DocumentNode';


GO





ALTER TABLE [Production].[ProductDocument]
    ADD CONSTRAINT [DF_ProductDocument_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductDocument', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductDocument_ModifiedDate';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-reference table mapping products to related product documents.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductDocument';


GO



