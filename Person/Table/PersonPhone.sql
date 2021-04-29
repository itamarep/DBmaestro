CREATE TABLE [Person].[PersonPhone] (
    [BusinessEntityID]  INT           NOT NULL,
    [PhoneNumber]       [dbo].[Phone] NOT NULL,
    [PhoneNumberTypeID] INT           NOT NULL,
    [ModifiedDate]      DATETIME      NOT NULL
);


GO

ALTER TABLE [Person].[PersonPhone]
    ADD CONSTRAINT [PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC, [PhoneNumber] ASC, [PhoneNumberTypeID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'PersonPhone', @level2type = N'CONSTRAINT', @level2name = N'PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID';


GO





ALTER TABLE [Person].[PersonPhone]
    ADD CONSTRAINT [FK_PersonPhone_Person_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Person.BusinessEntityID.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'PersonPhone', @level2type = N'CONSTRAINT', @level2name = N'FK_PersonPhone_Person_BusinessEntityID';


GO





ALTER TABLE [Person].[PersonPhone]
    ADD CONSTRAINT [FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID] FOREIGN KEY ([PhoneNumberTypeID]) REFERENCES [Person].[PhoneNumberType] ([PhoneNumberTypeID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing PhoneNumberType.PhoneNumberTypeID.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'PersonPhone', @level2type = N'CONSTRAINT', @level2name = N'FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID';


GO





ALTER TABLE [Person].[PersonPhone]
    ADD CONSTRAINT [DF_PersonPhone_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'PersonPhone', @level2type = N'CONSTRAINT', @level2name = N'DF_PersonPhone_ModifiedDate';


GO





CREATE NONCLUSTERED INDEX [IX_PersonPhone_PhoneNumber]
    ON [Person].[PersonPhone]([PhoneNumber] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'PersonPhone', @level2type = N'INDEX', @level2name = N'IX_PersonPhone_PhoneNumber';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Telephone number and type of a person.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'PersonPhone';


GO



