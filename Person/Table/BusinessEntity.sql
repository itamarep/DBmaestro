CREATE TABLE [Person].[BusinessEntity] (
    [BusinessEntityID] INT              IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [rowguid]          UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]     DATETIME         NOT NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [AK_BusinessEntity_rowguid]
    ON [Person].[BusinessEntity]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntity', @level2type = N'INDEX', @level2name = N'AK_BusinessEntity_rowguid';


GO





ALTER TABLE [Person].[BusinessEntity]
    ADD CONSTRAINT [DF_BusinessEntity_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntity', @level2type = N'CONSTRAINT', @level2name = N'DF_BusinessEntity_ModifiedDate';


GO





ALTER TABLE [Person].[BusinessEntity]
    ADD CONSTRAINT [DF_BusinessEntity_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntity', @level2type = N'CONSTRAINT', @level2name = N'DF_BusinessEntity_rowguid';


GO





ALTER TABLE [Person].[BusinessEntity]
    ADD CONSTRAINT [PK_BusinessEntity_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntity', @level2type = N'CONSTRAINT', @level2name = N'PK_BusinessEntity_BusinessEntityID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source of the ID that connects vendors, customers, and employees with address and contact information.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntity';


GO



