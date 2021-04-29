CREATE TABLE [Person].[EmailAddress] (
    [BusinessEntityID] INT              NOT NULL,
    [EmailAddressID]   INT              IDENTITY (1, 1) NOT NULL,
    [EmailAddress]     NVARCHAR (50)    NULL,
    [rowguid]          UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]     DATETIME         NOT NULL
);


GO

ALTER TABLE [Person].[EmailAddress]
    ADD CONSTRAINT [PK_EmailAddress_BusinessEntityID_EmailAddressID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC, [EmailAddressID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'EmailAddress', @level2type = N'CONSTRAINT', @level2name = N'PK_EmailAddress_BusinessEntityID_EmailAddressID';


GO





ALTER TABLE [Person].[EmailAddress]
    ADD CONSTRAINT [FK_EmailAddress_Person_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Person.BusinessEntityID.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'EmailAddress', @level2type = N'CONSTRAINT', @level2name = N'FK_EmailAddress_Person_BusinessEntityID';


GO





ALTER TABLE [Person].[EmailAddress]
    ADD CONSTRAINT [DF_EmailAddress_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'EmailAddress', @level2type = N'CONSTRAINT', @level2name = N'DF_EmailAddress_rowguid';


GO





ALTER TABLE [Person].[EmailAddress]
    ADD CONSTRAINT [DF_EmailAddress_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'EmailAddress', @level2type = N'CONSTRAINT', @level2name = N'DF_EmailAddress_ModifiedDate';


GO





CREATE NONCLUSTERED INDEX [IX_EmailAddress_EmailAddress]
    ON [Person].[EmailAddress]([EmailAddress] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'EmailAddress', @level2type = N'INDEX', @level2name = N'IX_EmailAddress_EmailAddress';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Where to send a person email.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'EmailAddress';


GO



