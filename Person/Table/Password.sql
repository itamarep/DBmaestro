CREATE TABLE [Person].[Password] (
    [BusinessEntityID] INT              NOT NULL,
    [PasswordHash]     VARCHAR (128)    NOT NULL,
    [PasswordSalt]     VARCHAR (10)     NOT NULL,
    [rowguid]          UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]     DATETIME         NOT NULL
);


GO

ALTER TABLE [Person].[Password]
    ADD CONSTRAINT [DF_Password_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Password', @level2type = N'CONSTRAINT', @level2name = N'DF_Password_ModifiedDate';


GO





ALTER TABLE [Person].[Password]
    ADD CONSTRAINT [DF_Password_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Password', @level2type = N'CONSTRAINT', @level2name = N'DF_Password_rowguid';


GO





ALTER TABLE [Person].[Password]
    ADD CONSTRAINT [FK_Password_Person_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Person.BusinessEntityID.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Password', @level2type = N'CONSTRAINT', @level2name = N'FK_Password_Person_BusinessEntityID';


GO





ALTER TABLE [Person].[Password]
    ADD CONSTRAINT [PK_Password_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Password', @level2type = N'CONSTRAINT', @level2name = N'PK_Password_BusinessEntityID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'One way hashed authentication information', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Password';


GO



