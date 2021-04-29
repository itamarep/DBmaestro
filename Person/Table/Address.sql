CREATE TABLE [Person].[Address] (
    [AddressID]       INT               IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [AddressLine1]    NVARCHAR (60)     NOT NULL,
    [AddressLine2]    NVARCHAR (60)     NULL,
    [City]            NVARCHAR (30)     NOT NULL,
    [StateProvinceID] INT               NOT NULL,
    [PostalCode]      NVARCHAR (15)     NOT NULL,
    [SpatialLocation] [sys].[geography] NULL,
    [rowguid]         UNIQUEIDENTIFIER  ROWGUIDCOL NOT NULL,
    [ModifiedDate]    DATETIME          NOT NULL
);


GO

ALTER TABLE [Person].[Address]
    ADD CONSTRAINT [PK_Address_AddressID] PRIMARY KEY CLUSTERED ([AddressID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Address', @level2type = N'CONSTRAINT', @level2name = N'PK_Address_AddressID';


GO





ALTER TABLE [Person].[Address]
    ADD CONSTRAINT [FK_Address_StateProvince_StateProvinceID] FOREIGN KEY ([StateProvinceID]) REFERENCES [Person].[StateProvince] ([StateProvinceID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing StateProvince.StateProvinceID.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Address', @level2type = N'CONSTRAINT', @level2name = N'FK_Address_StateProvince_StateProvinceID';


GO





ALTER TABLE [Person].[Address]
    ADD CONSTRAINT [DF_Address_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Address', @level2type = N'CONSTRAINT', @level2name = N'DF_Address_rowguid';


GO





ALTER TABLE [Person].[Address]
    ADD CONSTRAINT [DF_Address_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Address', @level2type = N'CONSTRAINT', @level2name = N'DF_Address_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Address_rowguid]
    ON [Person].[Address]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Address', @level2type = N'INDEX', @level2name = N'AK_Address_rowguid';


GO





CREATE UNIQUE NONCLUSTERED INDEX [IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode]
    ON [Person].[Address]([AddressLine1] ASC, [AddressLine2] ASC, [City] ASC, [StateProvinceID] ASC, [PostalCode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Address', @level2type = N'INDEX', @level2name = N'IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode';


GO





CREATE NONCLUSTERED INDEX [IX_Address_StateProvinceID]
    ON [Person].[Address]([StateProvinceID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Address', @level2type = N'INDEX', @level2name = N'IX_Address_StateProvinceID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Street address information for customers, employees, and vendors.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Address';


GO



