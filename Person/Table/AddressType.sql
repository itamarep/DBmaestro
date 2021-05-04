CREATE TABLE [Person].[AddressType] (
    [AddressTypeID] INT              IDENTITY (1, 1) NOT NULL,
    [Name]          [dbo].[Name]     NOT NULL,
    [rowguid]       UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]  DATETIME         NOT NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [AK_AddressType_Name]
    ON [Person].[AddressType]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'AddressType', @level2type = N'INDEX', @level2name = N'AK_AddressType_Name';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_AddressType_rowguid]
    ON [Person].[AddressType]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'AddressType', @level2type = N'INDEX', @level2name = N'AK_AddressType_rowguid';


GO





ALTER TABLE [Person].[AddressType]
    ADD CONSTRAINT [DF_AddressType_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'AddressType', @level2type = N'CONSTRAINT', @level2name = N'DF_AddressType_ModifiedDate';


GO





ALTER TABLE [Person].[AddressType]
    ADD CONSTRAINT [DF_AddressType_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'AddressType', @level2type = N'CONSTRAINT', @level2name = N'DF_AddressType_rowguid';


GO





ALTER TABLE [Person].[AddressType]
    ADD CONSTRAINT [PK_AddressType_AddressTypeID] PRIMARY KEY CLUSTERED ([AddressTypeID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'AddressType', @level2type = N'CONSTRAINT', @level2name = N'PK_AddressType_AddressTypeID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Types of addresses stored in the Address table. ', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'AddressType';


GO



