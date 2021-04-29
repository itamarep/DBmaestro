CREATE TABLE [Sales].[Currency] (
    [CurrencyCode] NCHAR (3)    NOT NULL,
    [Name]         [dbo].[Name] NOT NULL,
    [ModifiedDate] DATETIME     NOT NULL
);


GO

ALTER TABLE [Sales].[Currency]
    ADD CONSTRAINT [PK_Currency_CurrencyCode] PRIMARY KEY CLUSTERED ([CurrencyCode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Currency', @level2type = N'CONSTRAINT', @level2name = N'PK_Currency_CurrencyCode';


GO





ALTER TABLE [Sales].[Currency]
    ADD CONSTRAINT [DF_Currency_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Currency', @level2type = N'CONSTRAINT', @level2name = N'DF_Currency_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Currency_Name]
    ON [Sales].[Currency]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Currency', @level2type = N'INDEX', @level2name = N'AK_Currency_Name';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lookup table containing standard ISO currencies.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Currency';


GO



