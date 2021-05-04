CREATE TABLE [Production].[ProductPhoto] (
    [ProductPhotoID]         INT             IDENTITY (1, 1) NOT NULL,
    [ThumbNailPhoto]         VARBINARY (MAX) NULL,
    [ThumbnailPhotoFileName] NVARCHAR (50)   NULL,
    [LargePhoto]             VARBINARY (MAX) NULL,
    [LargePhotoFileName]     NVARCHAR (50)   NULL,
    [ModifiedDate]           DATETIME        NOT NULL
);


GO

ALTER TABLE [Production].[ProductPhoto]
    ADD CONSTRAINT [DF_ProductPhoto_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductPhoto', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductPhoto_ModifiedDate';


GO





ALTER TABLE [Production].[ProductPhoto]
    ADD CONSTRAINT [PK_ProductPhoto_ProductPhotoID] PRIMARY KEY CLUSTERED ([ProductPhotoID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductPhoto', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductPhoto_ProductPhotoID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Product images.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductPhoto';


GO



