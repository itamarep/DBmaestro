CREATE TABLE [Sales].[CurrencyRate] (
    [CurrencyRateID]   INT       IDENTITY (1, 1) NOT NULL,
    [CurrencyRateDate] DATETIME  NOT NULL,
    [FromCurrencyCode] NCHAR (3) NOT NULL,
    [ToCurrencyCode]   NCHAR (3) NOT NULL,
    [AverageRate]      MONEY     NOT NULL,
    [EndOfDayRate]     MONEY     NOT NULL,
    [ModifiedDate]     DATETIME  NOT NULL
);


GO

ALTER TABLE [Sales].[CurrencyRate]
    ADD CONSTRAINT [PK_CurrencyRate_CurrencyRateID] PRIMARY KEY CLUSTERED ([CurrencyRateID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CurrencyRate', @level2type = N'CONSTRAINT', @level2name = N'PK_CurrencyRate_CurrencyRateID';


GO





ALTER TABLE [Sales].[CurrencyRate]
    ADD CONSTRAINT [FK_CurrencyRate_Currency_FromCurrencyCode] FOREIGN KEY ([FromCurrencyCode]) REFERENCES [Sales].[Currency] ([CurrencyCode]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Currency.FromCurrencyCode.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CurrencyRate', @level2type = N'CONSTRAINT', @level2name = N'FK_CurrencyRate_Currency_FromCurrencyCode';


GO





ALTER TABLE [Sales].[CurrencyRate]
    ADD CONSTRAINT [FK_CurrencyRate_Currency_ToCurrencyCode] FOREIGN KEY ([ToCurrencyCode]) REFERENCES [Sales].[Currency] ([CurrencyCode]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Currency.ToCurrencyCode.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CurrencyRate', @level2type = N'CONSTRAINT', @level2name = N'FK_CurrencyRate_Currency_ToCurrencyCode';


GO





ALTER TABLE [Sales].[CurrencyRate]
    ADD CONSTRAINT [DF_CurrencyRate_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CurrencyRate', @level2type = N'CONSTRAINT', @level2name = N'DF_CurrencyRate_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode]
    ON [Sales].[CurrencyRate]([CurrencyRateDate] ASC, [FromCurrencyCode] ASC, [ToCurrencyCode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CurrencyRate', @level2type = N'INDEX', @level2name = N'AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Currency exchange rates.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CurrencyRate';


GO



