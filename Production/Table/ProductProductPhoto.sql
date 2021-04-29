CREATE TABLE [Production].[ProductProductPhoto] (
    [ProductID]      INT          NOT NULL,
    [ProductPhotoID] INT          NOT NULL,
    [Primary]        [dbo].[Flag] NOT NULL,
    [ModifiedDate]   DATETIME     NOT NULL
);


GO

ALTER TABLE [Production].[ProductProductPhoto]
    ADD CONSTRAINT [PK_ProductProductPhoto_ProductID_ProductPhotoID] PRIMARY KEY NONCLUSTERED ([ProductID] ASC, [ProductPhotoID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductProductPhoto', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductProductPhoto_ProductID_ProductPhotoID';


GO





ALTER TABLE [Production].[ProductProductPhoto]
    ADD CONSTRAINT [FK_ProductProductPhoto_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Product.ProductID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductProductPhoto', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductProductPhoto_Product_ProductID';


GO





ALTER TABLE [Production].[ProductProductPhoto]
    ADD CONSTRAINT [FK_ProductProductPhoto_ProductPhoto_ProductPhotoID] FOREIGN KEY ([ProductPhotoID]) REFERENCES [Production].[ProductPhoto] ([ProductPhotoID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing ProductPhoto.ProductPhotoID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductProductPhoto', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductProductPhoto_ProductPhoto_ProductPhotoID';


GO





ALTER TABLE [Production].[ProductProductPhoto]
    ADD CONSTRAINT [DF_ProductProductPhoto_Primary] DEFAULT ((0)) FOR [Primary];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0 (FALSE)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductProductPhoto', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductProductPhoto_Primary';


GO





ALTER TABLE [Production].[ProductProductPhoto]
    ADD CONSTRAINT [DF_ProductProductPhoto_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductProductPhoto', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductProductPhoto_ModifiedDate';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-reference table mapping products and product photos.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductProductPhoto';


GO



