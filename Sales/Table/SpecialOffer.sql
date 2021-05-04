CREATE TABLE [Sales].[SpecialOffer] (
    [SpecialOfferID] INT              IDENTITY (1, 1) NOT NULL,
    [Description]    NVARCHAR (255)   NOT NULL,
    [DiscountPct]    SMALLMONEY       NOT NULL,
    [Type]           NVARCHAR (50)    NOT NULL,
    [Category]       NVARCHAR (50)    NOT NULL,
    [StartDate]      DATETIME         NOT NULL,
    [EndDate]        DATETIME         NOT NULL,
    [MinQty]         INT              NOT NULL,
    [MaxQty]         INT              NULL,
    [rowguid]        UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]   DATETIME         NOT NULL
);


GO

ALTER TABLE [Sales].[SpecialOffer]
    ADD CONSTRAINT [CK_SpecialOffer_DiscountPct] CHECK ([DiscountPct]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [DiscountPct] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'CK_SpecialOffer_DiscountPct';


GO





ALTER TABLE [Sales].[SpecialOffer]
    ADD CONSTRAINT [CK_SpecialOffer_EndDate] CHECK ([EndDate]>=[StartDate]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [EndDate] >= [StartDate]', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'CK_SpecialOffer_EndDate';


GO





ALTER TABLE [Sales].[SpecialOffer]
    ADD CONSTRAINT [CK_SpecialOffer_MaxQty] CHECK ([MaxQty]>=(0));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [MaxQty] >= (0)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'CK_SpecialOffer_MaxQty';


GO





ALTER TABLE [Sales].[SpecialOffer]
    ADD CONSTRAINT [CK_SpecialOffer_MinQty] CHECK ([MinQty]>=(0));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [MinQty] >= (0)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'CK_SpecialOffer_MinQty';


GO





ALTER TABLE [Sales].[SpecialOffer]
    ADD CONSTRAINT [DF_SpecialOffer_DiscountPct] DEFAULT ((0.00)) FOR [DiscountPct];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'DF_SpecialOffer_DiscountPct';


GO





ALTER TABLE [Sales].[SpecialOffer]
    ADD CONSTRAINT [DF_SpecialOffer_MinQty] DEFAULT ((0)) FOR [MinQty];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'DF_SpecialOffer_MinQty';


GO





ALTER TABLE [Sales].[SpecialOffer]
    ADD CONSTRAINT [DF_SpecialOffer_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'DF_SpecialOffer_ModifiedDate';


GO





ALTER TABLE [Sales].[SpecialOffer]
    ADD CONSTRAINT [DF_SpecialOffer_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'DF_SpecialOffer_rowguid';


GO





ALTER TABLE [Sales].[SpecialOffer]
    ADD CONSTRAINT [PK_SpecialOffer_SpecialOfferID] PRIMARY KEY CLUSTERED ([SpecialOfferID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'PK_SpecialOffer_SpecialOfferID';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_SpecialOffer_rowguid]
    ON [Sales].[SpecialOffer]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'INDEX', @level2name = N'AK_SpecialOffer_rowguid';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sale discounts lookup table.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer';


GO



