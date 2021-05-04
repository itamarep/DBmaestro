CREATE TABLE [Production].[ProductReview] (
    [ProductReviewID] INT             IDENTITY (1, 1) NOT NULL,
    [ProductID]       INT             NOT NULL,
    [ReviewerName]    [dbo].[Name]    NOT NULL,
    [ReviewDate]      DATETIME        NOT NULL,
    [EmailAddress]    NVARCHAR (50)   NOT NULL,
    [Rating]          INT             NOT NULL,
    [Comments]        NVARCHAR (3850) NULL,
    [ModifiedDate]    DATETIME        NOT NULL
);


GO

ALTER TABLE [Production].[ProductReview]
    ADD CONSTRAINT [CK_ProductReview_Rating] CHECK ([Rating]>=(1) AND [Rating]<=(5));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [Rating] BETWEEN (1) AND (5)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductReview', @level2type = N'CONSTRAINT', @level2name = N'CK_ProductReview_Rating';


GO





ALTER TABLE [Production].[ProductReview]
    ADD CONSTRAINT [DF_ProductReview_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductReview', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductReview_ModifiedDate';


GO





ALTER TABLE [Production].[ProductReview]
    ADD CONSTRAINT [DF_ProductReview_ReviewDate] DEFAULT (getdate()) FOR [ReviewDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductReview', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductReview_ReviewDate';


GO





ALTER TABLE [Production].[ProductReview]
    ADD CONSTRAINT [FK_ProductReview_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Product.ProductID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductReview', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductReview_Product_ProductID';


GO





ALTER TABLE [Production].[ProductReview]
    ADD CONSTRAINT [PK_ProductReview_ProductReviewID] PRIMARY KEY CLUSTERED ([ProductReviewID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductReview', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductReview_ProductReviewID';


GO





CREATE FULLTEXT INDEX ON [Production].[ProductReview]
    ([Comments] LANGUAGE 1033)
    KEY INDEX [PK_ProductReview_ProductReviewID]
    ON [AW2016FullTextCatalog];


GO



CREATE NONCLUSTERED INDEX [IX_ProductReview_ProductID_Name]
    ON [Production].[ProductReview]([ProductID] ASC, [ReviewerName] ASC)
    INCLUDE([Comments]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductReview', @level2type = N'INDEX', @level2name = N'IX_ProductReview_ProductID_Name';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer reviews of products they have purchased.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductReview';


GO



