CREATE SCHEMA [Person]
    AUTHORIZATION [dbo];


GO

CREATE XML SCHEMA COLLECTION [Person].[AdditionalContactInfoSchemaCollection]
    AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo">
  <xsd:element name="AdditionalContactInfo">
    <xsd:complexType mixed="true">
      <xsd:complexContent mixed="true">
        <xsd:restriction base="xsd:anyType">
          <xsd:sequence>
            <xsd:any namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactRecord http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" minOccurs="0" maxOccurs="unbounded" />
          </xsd:sequence>
        </xsd:restriction>
      </xsd:complexContent>
    </xsd:complexType>
  </xsd:element>
</xsd:schema>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactRecord" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactRecord">
  <xsd:element name="ContactRecord">
    <xsd:complexType mixed="true">
      <xsd:complexContent mixed="true">
        <xsd:restriction base="xsd:anyType">
          <xsd:choice minOccurs="0" maxOccurs="unbounded">
            <xsd:any namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" />
          </xsd:choice>
          <xsd:attribute name="date" type="xsd:date" />
        </xsd:restriction>
      </xsd:complexContent>
    </xsd:complexType>
  </xsd:element>
</xsd:schema>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" elementFormDefault="qualified">
  <xsd:element name="eMail" type="t:eMailType" />
  <xsd:element name="facsimileTelephoneNumber" type="t:phoneNumberType" />
  <xsd:element name="homePostalAddress" type="t:addressType" />
  <xsd:element name="internationaliSDNNumber" type="t:phoneNumberType" />
  <xsd:element name="mobile" type="t:phoneNumberType" />
  <xsd:element name="pager" type="t:phoneNumberType" />
  <xsd:element name="physicalDeliveryOfficeName" type="t:addressType" />
  <xsd:element name="registeredAddress" type="t:addressType" />
  <xsd:element name="telephoneNumber" type="t:phoneNumberType" />
  <xsd:element name="telexNumber" type="t:phoneNumberType" />
  <xsd:complexType name="addressType">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Street" type="xsd:string" maxOccurs="2" />
          <xsd:element name="City" type="xsd:string" />
          <xsd:element name="StateProvince" type="xsd:string" />
          <xsd:element name="PostalCode" type="xsd:string" minOccurs="0" />
          <xsd:element name="CountryRegion" type="xsd:string" />
          <xsd:element name="SpecialInstructions" type="t:specialInstructionsType" minOccurs="0" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="eMailType">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="eMailAddress" type="xsd:string" />
          <xsd:element name="SpecialInstructions" type="t:specialInstructionsType" minOccurs="0" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="phoneNumberType">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="number">
            <xsd:simpleType>
              <xsd:restriction base="xsd:string">
                <xsd:pattern value="[0-9\(\)\-]*" />
              </xsd:restriction>
            </xsd:simpleType>
          </xsd:element>
          <xsd:element name="SpecialInstructions" type="t:specialInstructionsType" minOccurs="0" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="specialInstructionsType" mixed="true">
    <xsd:complexContent mixed="true">
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:any namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" minOccurs="0" maxOccurs="unbounded" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
</xsd:schema>';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Collection of XML schemas for the AdditionalContactInfo column in the Person.Contact table.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'XML SCHEMA COLLECTION', @level1name = N'AdditionalContactInfoSchemaCollection';


GO





CREATE XML SCHEMA COLLECTION [Person].[IndividualSurveySchemaCollection]
    AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey" elementFormDefault="qualified">
  <xsd:element name="IndividualSurvey">
    <xsd:complexType>
      <xsd:complexContent>
        <xsd:restriction base="xsd:anyType">
          <xsd:sequence>
            <xsd:element name="TotalPurchaseYTD" type="xsd:decimal" minOccurs="0" />
            <xsd:element name="DateFirstPurchase" type="xsd:date" minOccurs="0" />
            <xsd:element name="BirthDate" type="xsd:date" minOccurs="0" />
            <xsd:element name="MaritalStatus" type="xsd:string" minOccurs="0" />
            <xsd:element name="YearlyIncome" type="t:SalaryType" minOccurs="0" />
            <xsd:element name="Gender" type="xsd:string" minOccurs="0" />
            <xsd:element name="TotalChildren" type="xsd:int" minOccurs="0" />
            <xsd:element name="NumberChildrenAtHome" type="xsd:int" minOccurs="0" />
            <xsd:element name="Education" type="xsd:string" minOccurs="0" />
            <xsd:element name="Occupation" type="xsd:string" minOccurs="0" />
            <xsd:element name="HomeOwnerFlag" type="xsd:string" minOccurs="0" />
            <xsd:element name="NumberCarsOwned" type="xsd:int" minOccurs="0" />
            <xsd:element name="Hobby" type="xsd:string" minOccurs="0" maxOccurs="unbounded" />
            <xsd:element name="CommuteDistance" type="t:MileRangeType" minOccurs="0" />
            <xsd:element name="Comments" type="xsd:string" minOccurs="0" />
          </xsd:sequence>
        </xsd:restriction>
      </xsd:complexContent>
    </xsd:complexType>
  </xsd:element>
  <xsd:simpleType name="MileRangeType">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="0-1 Miles" />
      <xsd:enumeration value="1-2 Miles" />
      <xsd:enumeration value="2-5 Miles" />
      <xsd:enumeration value="5-10 Miles" />
      <xsd:enumeration value="10+ Miles" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="SalaryType">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="0-25000" />
      <xsd:enumeration value="25001-50000" />
      <xsd:enumeration value="50001-75000" />
      <xsd:enumeration value="75001-100000" />
      <xsd:enumeration value="greater than 100000" />
    </xsd:restriction>
  </xsd:simpleType>
</xsd:schema>';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Collection of XML schemas for the Demographics column in the Person.Person table.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'XML SCHEMA COLLECTION', @level1name = N'IndividualSurveySchemaCollection';


GO





CREATE TABLE [Person].[Password] (
    [BusinessEntityID] INT              NOT NULL,
    [PasswordHash]     VARCHAR (128)    NOT NULL,
    [PasswordSalt]     VARCHAR (10)     NOT NULL,
    [rowguid]          UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]     DATETIME         NOT NULL
);


GO

ALTER TABLE [Person].[Password]
    ADD CONSTRAINT [PK_Password_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Password', @level2type = N'CONSTRAINT', @level2name = N'PK_Password_BusinessEntityID';


GO





ALTER TABLE [Person].[Password]
    ADD CONSTRAINT [FK_Password_Person_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Person.BusinessEntityID.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Password', @level2type = N'CONSTRAINT', @level2name = N'FK_Password_Person_BusinessEntityID';


GO





ALTER TABLE [Person].[Password]
    ADD CONSTRAINT [DF_Password_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Password', @level2type = N'CONSTRAINT', @level2name = N'DF_Password_rowguid';


GO





ALTER TABLE [Person].[Password]
    ADD CONSTRAINT [DF_Password_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Password', @level2type = N'CONSTRAINT', @level2name = N'DF_Password_ModifiedDate';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'One way hashed authentication information', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Password';


GO





CREATE TABLE [Person].[Person] (
    [BusinessEntityID]      INT                                                           NOT NULL,
    [PersonType]            NCHAR (2)                                                     NOT NULL,
    [NameStyle]             [dbo].[NameStyle]                                             NOT NULL,
    [Title]                 NVARCHAR (8)                                                  NULL,
    [FirstName]             [dbo].[Name]                                                  NOT NULL,
    [MiddleName]            [dbo].[Name]                                                  NULL,
    [LastName]              [dbo].[Name]                                                  NOT NULL,
    [Suffix]                NVARCHAR (10)                                                 NULL,
    [EmailPromotion]        INT                                                           NOT NULL,
    [AdditionalContactInfo] XML(CONTENT [Person].[AdditionalContactInfoSchemaCollection]) NULL,
    [Demographics]          XML(CONTENT [Person].[IndividualSurveySchemaCollection])      NULL,
    [rowguid]               UNIQUEIDENTIFIER                                              ROWGUIDCOL NOT NULL,
    [ModifiedDate]          DATETIME                                                      NOT NULL
);


GO

ALTER TABLE [Person].[Person]
    ADD CONSTRAINT [PK_Person_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'CONSTRAINT', @level2name = N'PK_Person_BusinessEntityID';


GO





ALTER TABLE [Person].[Person]
    ADD CONSTRAINT [FK_Person_BusinessEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing BusinessEntity.BusinessEntityID.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'CONSTRAINT', @level2name = N'FK_Person_BusinessEntity_BusinessEntityID';


GO





ALTER TABLE [Person].[Person]
    ADD CONSTRAINT [DF_Person_NameStyle] DEFAULT ((0)) FOR [NameStyle];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'CONSTRAINT', @level2name = N'DF_Person_NameStyle';


GO





ALTER TABLE [Person].[Person]
    ADD CONSTRAINT [DF_Person_EmailPromotion] DEFAULT ((0)) FOR [EmailPromotion];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'CONSTRAINT', @level2name = N'DF_Person_EmailPromotion';


GO





ALTER TABLE [Person].[Person]
    ADD CONSTRAINT [DF_Person_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'CONSTRAINT', @level2name = N'DF_Person_rowguid';


GO





ALTER TABLE [Person].[Person]
    ADD CONSTRAINT [DF_Person_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'CONSTRAINT', @level2name = N'DF_Person_ModifiedDate';


GO





ALTER TABLE [Person].[Person]
    ADD CONSTRAINT [CK_Person_EmailPromotion] CHECK ([EmailPromotion]>=(0) AND [EmailPromotion]<=(2));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [EmailPromotion] >= (0) AND [EmailPromotion] <= (2)', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'CONSTRAINT', @level2name = N'CK_Person_EmailPromotion';


GO





ALTER TABLE [Person].[Person]
    ADD CONSTRAINT [CK_Person_PersonType] CHECK ([PersonType] IS NULL OR (upper([PersonType])='GC' OR upper([PersonType])='SP' OR upper([PersonType])='EM' OR upper([PersonType])='IN' OR upper([PersonType])='VC' OR upper([PersonType])='SC'));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [PersonType] is one of SC, VC, IN, EM or SP.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'CONSTRAINT', @level2name = N'CK_Person_PersonType';


GO





CREATE NONCLUSTERED INDEX [IX_Person_LastName_FirstName_MiddleName]
    ON [Person].[Person]([LastName] ASC, [FirstName] ASC, [MiddleName] ASC);


GO



CREATE UNIQUE NONCLUSTERED INDEX [AK_Person_rowguid]
    ON [Person].[Person]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'INDEX', @level2name = N'AK_Person_rowguid';


GO





CREATE PRIMARY XML INDEX [PXML_Person_AddContact]
    ON [Person].[Person]([AdditionalContactInfo])
    WITH (PAD_INDEX = OFF);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary XML index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'INDEX', @level2name = N'PXML_Person_AddContact';


GO





CREATE PRIMARY XML INDEX [PXML_Person_Demographics]
    ON [Person].[Person]([Demographics])
    WITH (PAD_INDEX = OFF);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary XML index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'INDEX', @level2name = N'PXML_Person_Demographics';


GO





CREATE XML INDEX [XMLPATH_Person_Demographics]
    ON [Person].[Person]([Demographics])
    USING XML INDEX [PXML_Person_Demographics] FOR PATH
    WITH (PAD_INDEX = OFF);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Secondary XML index for path.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'INDEX', @level2name = N'XMLPATH_Person_Demographics';


GO





CREATE XML INDEX [XMLPROPERTY_Person_Demographics]
    ON [Person].[Person]([Demographics])
    USING XML INDEX [PXML_Person_Demographics] FOR PROPERTY
    WITH (PAD_INDEX = OFF);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Secondary XML index for property.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'INDEX', @level2name = N'XMLPROPERTY_Person_Demographics';


GO





CREATE XML INDEX [XMLVALUE_Person_Demographics]
    ON [Person].[Person]([Demographics])
    USING XML INDEX [PXML_Person_Demographics] FOR VALUE
    WITH (PAD_INDEX = OFF);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Secondary XML index for value.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'INDEX', @level2name = N'XMLVALUE_Person_Demographics';


GO






CREATE TRIGGER [Person].[iuPerson] ON [Person].[Person] 
AFTER INSERT, UPDATE NOT FOR REPLICATION AS 
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0 
        RETURN;

    SET NOCOUNT ON;

    IF UPDATE([BusinessEntityID]) OR UPDATE([Demographics]) 
    BEGIN
        UPDATE [Person].[Person] 
        SET [Person].[Person].[Demographics] = N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"> 
            <TotalPurchaseYTD>0.00</TotalPurchaseYTD> 
            </IndividualSurvey>' 
        FROM inserted 
        WHERE [Person].[Person].[BusinessEntityID] = inserted.[BusinessEntityID] 
            AND inserted.[Demographics] IS NULL;
        
        UPDATE [Person].[Person] 
        SET [Demographics].modify(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
            insert <TotalPurchaseYTD>0.00</TotalPurchaseYTD> 
            as first 
            into (/IndividualSurvey)[1]') 
        FROM inserted 
        WHERE [Person].[Person].[BusinessEntityID] = inserted.[BusinessEntityID] 
            AND inserted.[Demographics] IS NOT NULL 
            AND inserted.[Demographics].exist(N'declare default element namespace 
                "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
                /IndividualSurvey/TotalPurchaseYTD') <> 1;
    END;
END;
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'AFTER INSERT, UPDATE trigger inserting Individual only if the Customer does not exist in the Store table and setting the ModifiedDate column in the Person table to the current date.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'TRIGGER', @level2name = N'iuPerson';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Human beings involved with AdventureWorks: employees, customer contacts, and vendor contacts.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'Person';


GO





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





CREATE TABLE [Person].[PhoneNumberType] (
    [PhoneNumberTypeID] INT          IDENTITY (1, 1) NOT NULL,
    [Name]              [dbo].[Name] NOT NULL,
    [ModifiedDate]      DATETIME     NOT NULL
);


GO

ALTER TABLE [Person].[PhoneNumberType]
    ADD CONSTRAINT [PK_PhoneNumberType_PhoneNumberTypeID] PRIMARY KEY CLUSTERED ([PhoneNumberTypeID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'PhoneNumberType', @level2type = N'CONSTRAINT', @level2name = N'PK_PhoneNumberType_PhoneNumberTypeID';


GO





ALTER TABLE [Person].[PhoneNumberType]
    ADD CONSTRAINT [DF_PhoneNumberType_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'PhoneNumberType', @level2type = N'CONSTRAINT', @level2name = N'DF_PhoneNumberType_ModifiedDate';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of phone number of a person.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'PhoneNumberType';


GO





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





CREATE TABLE [Person].[AddressType] (
    [AddressTypeID] INT              IDENTITY (1, 1) NOT NULL,
    [Name]          [dbo].[Name]     NOT NULL,
    [rowguid]       UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]  DATETIME         NOT NULL
);


GO

ALTER TABLE [Person].[AddressType]
    ADD CONSTRAINT [PK_AddressType_AddressTypeID] PRIMARY KEY CLUSTERED ([AddressTypeID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'AddressType', @level2type = N'CONSTRAINT', @level2name = N'PK_AddressType_AddressTypeID';


GO





ALTER TABLE [Person].[AddressType]
    ADD CONSTRAINT [DF_AddressType_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'AddressType', @level2type = N'CONSTRAINT', @level2name = N'DF_AddressType_rowguid';


GO





ALTER TABLE [Person].[AddressType]
    ADD CONSTRAINT [DF_AddressType_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'AddressType', @level2type = N'CONSTRAINT', @level2name = N'DF_AddressType_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_AddressType_rowguid]
    ON [Person].[AddressType]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'AddressType', @level2type = N'INDEX', @level2name = N'AK_AddressType_rowguid';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_AddressType_Name]
    ON [Person].[AddressType]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'AddressType', @level2type = N'INDEX', @level2name = N'AK_AddressType_Name';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Types of addresses stored in the Address table. ', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'AddressType';


GO





CREATE TABLE [Person].[StateProvince] (
    [StateProvinceID]         INT              IDENTITY (1, 1) NOT NULL,
    [StateProvinceCode]       NCHAR (3)        NOT NULL,
    [CountryRegionCode]       NVARCHAR (3)     NOT NULL,
    [IsOnlyStateProvinceFlag] [dbo].[Flag]     NOT NULL,
    [Name]                    [dbo].[Name]     NOT NULL,
    [TerritoryID]             INT              NOT NULL,
    [rowguid]                 UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]            DATETIME         NOT NULL
);


GO

ALTER TABLE [Person].[StateProvince]
    ADD CONSTRAINT [PK_StateProvince_StateProvinceID] PRIMARY KEY CLUSTERED ([StateProvinceID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'CONSTRAINT', @level2name = N'PK_StateProvince_StateProvinceID';


GO





ALTER TABLE [Person].[StateProvince]
    ADD CONSTRAINT [FK_StateProvince_CountryRegion_CountryRegionCode] FOREIGN KEY ([CountryRegionCode]) REFERENCES [Person].[CountryRegion] ([CountryRegionCode]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing CountryRegion.CountryRegionCode.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'CONSTRAINT', @level2name = N'FK_StateProvince_CountryRegion_CountryRegionCode';


GO





ALTER TABLE [Person].[StateProvince]
    ADD CONSTRAINT [FK_StateProvince_SalesTerritory_TerritoryID] FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing SalesTerritory.TerritoryID.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'CONSTRAINT', @level2name = N'FK_StateProvince_SalesTerritory_TerritoryID';


GO





ALTER TABLE [Person].[StateProvince]
    ADD CONSTRAINT [DF_StateProvince_IsOnlyStateProvinceFlag] DEFAULT ((1)) FOR [IsOnlyStateProvinceFlag];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 1 (TRUE)', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'CONSTRAINT', @level2name = N'DF_StateProvince_IsOnlyStateProvinceFlag';


GO





ALTER TABLE [Person].[StateProvince]
    ADD CONSTRAINT [DF_StateProvince_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'CONSTRAINT', @level2name = N'DF_StateProvince_rowguid';


GO





ALTER TABLE [Person].[StateProvince]
    ADD CONSTRAINT [DF_StateProvince_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'CONSTRAINT', @level2name = N'DF_StateProvince_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_StateProvince_Name]
    ON [Person].[StateProvince]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'INDEX', @level2name = N'AK_StateProvince_Name';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_StateProvince_StateProvinceCode_CountryRegionCode]
    ON [Person].[StateProvince]([StateProvinceCode] ASC, [CountryRegionCode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'INDEX', @level2name = N'AK_StateProvince_StateProvinceCode_CountryRegionCode';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_StateProvince_rowguid]
    ON [Person].[StateProvince]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince', @level2type = N'INDEX', @level2name = N'AK_StateProvince_rowguid';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'State and province lookup table.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'StateProvince';


GO





CREATE TABLE [Person].[BusinessEntity] (
    [BusinessEntityID] INT              IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [rowguid]          UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]     DATETIME         NOT NULL
);


GO

ALTER TABLE [Person].[BusinessEntity]
    ADD CONSTRAINT [PK_BusinessEntity_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntity', @level2type = N'CONSTRAINT', @level2name = N'PK_BusinessEntity_BusinessEntityID';


GO





ALTER TABLE [Person].[BusinessEntity]
    ADD CONSTRAINT [DF_BusinessEntity_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntity', @level2type = N'CONSTRAINT', @level2name = N'DF_BusinessEntity_rowguid';


GO





ALTER TABLE [Person].[BusinessEntity]
    ADD CONSTRAINT [DF_BusinessEntity_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntity', @level2type = N'CONSTRAINT', @level2name = N'DF_BusinessEntity_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_BusinessEntity_rowguid]
    ON [Person].[BusinessEntity]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntity', @level2type = N'INDEX', @level2name = N'AK_BusinessEntity_rowguid';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Source of the ID that connects vendors, customers, and employees with address and contact information.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntity';


GO





CREATE TABLE [Person].[BusinessEntityAddress] (
    [BusinessEntityID] INT              NOT NULL,
    [AddressID]        INT              NOT NULL,
    [AddressTypeID]    INT              NOT NULL,
    [rowguid]          UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]     DATETIME         NOT NULL
);


GO

ALTER TABLE [Person].[BusinessEntityAddress]
    ADD CONSTRAINT [PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC, [AddressID] ASC, [AddressTypeID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityAddress', @level2type = N'CONSTRAINT', @level2name = N'PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID';


GO





ALTER TABLE [Person].[BusinessEntityAddress]
    ADD CONSTRAINT [FK_BusinessEntityAddress_Address_AddressID] FOREIGN KEY ([AddressID]) REFERENCES [Person].[Address] ([AddressID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Address.AddressID.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityAddress', @level2type = N'CONSTRAINT', @level2name = N'FK_BusinessEntityAddress_Address_AddressID';


GO





ALTER TABLE [Person].[BusinessEntityAddress]
    ADD CONSTRAINT [FK_BusinessEntityAddress_AddressType_AddressTypeID] FOREIGN KEY ([AddressTypeID]) REFERENCES [Person].[AddressType] ([AddressTypeID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing AddressType.AddressTypeID.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityAddress', @level2type = N'CONSTRAINT', @level2name = N'FK_BusinessEntityAddress_AddressType_AddressTypeID';


GO





ALTER TABLE [Person].[BusinessEntityAddress]
    ADD CONSTRAINT [FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing BusinessEntity.BusinessEntityID.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityAddress', @level2type = N'CONSTRAINT', @level2name = N'FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID';


GO





ALTER TABLE [Person].[BusinessEntityAddress]
    ADD CONSTRAINT [DF_BusinessEntityAddress_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityAddress', @level2type = N'CONSTRAINT', @level2name = N'DF_BusinessEntityAddress_rowguid';


GO





ALTER TABLE [Person].[BusinessEntityAddress]
    ADD CONSTRAINT [DF_BusinessEntityAddress_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityAddress', @level2type = N'CONSTRAINT', @level2name = N'DF_BusinessEntityAddress_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_BusinessEntityAddress_rowguid]
    ON [Person].[BusinessEntityAddress]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityAddress', @level2type = N'INDEX', @level2name = N'AK_BusinessEntityAddress_rowguid';


GO





CREATE NONCLUSTERED INDEX [IX_BusinessEntityAddress_AddressID]
    ON [Person].[BusinessEntityAddress]([AddressID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityAddress', @level2type = N'INDEX', @level2name = N'IX_BusinessEntityAddress_AddressID';


GO





CREATE NONCLUSTERED INDEX [IX_BusinessEntityAddress_AddressTypeID]
    ON [Person].[BusinessEntityAddress]([AddressTypeID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityAddress', @level2type = N'INDEX', @level2name = N'IX_BusinessEntityAddress_AddressTypeID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-reference table mapping customers, vendors, and employees to their addresses.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityAddress';


GO





CREATE TABLE [Person].[BusinessEntityContact] (
    [BusinessEntityID] INT              NOT NULL,
    [PersonID]         INT              NOT NULL,
    [ContactTypeID]    INT              NOT NULL,
    [rowguid]          UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]     DATETIME         NOT NULL
);


GO

ALTER TABLE [Person].[BusinessEntityContact]
    ADD CONSTRAINT [PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC, [PersonID] ASC, [ContactTypeID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityContact', @level2type = N'CONSTRAINT', @level2name = N'PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID';


GO





ALTER TABLE [Person].[BusinessEntityContact]
    ADD CONSTRAINT [FK_BusinessEntityContact_Person_PersonID] FOREIGN KEY ([PersonID]) REFERENCES [Person].[Person] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Person.BusinessEntityID.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityContact', @level2type = N'CONSTRAINT', @level2name = N'FK_BusinessEntityContact_Person_PersonID';


GO





ALTER TABLE [Person].[BusinessEntityContact]
    ADD CONSTRAINT [FK_BusinessEntityContact_ContactType_ContactTypeID] FOREIGN KEY ([ContactTypeID]) REFERENCES [Person].[ContactType] ([ContactTypeID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing ContactType.ContactTypeID.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityContact', @level2type = N'CONSTRAINT', @level2name = N'FK_BusinessEntityContact_ContactType_ContactTypeID';


GO





ALTER TABLE [Person].[BusinessEntityContact]
    ADD CONSTRAINT [FK_BusinessEntityContact_BusinessEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing BusinessEntity.BusinessEntityID.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityContact', @level2type = N'CONSTRAINT', @level2name = N'FK_BusinessEntityContact_BusinessEntity_BusinessEntityID';


GO





ALTER TABLE [Person].[BusinessEntityContact]
    ADD CONSTRAINT [DF_BusinessEntityContact_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityContact', @level2type = N'CONSTRAINT', @level2name = N'DF_BusinessEntityContact_rowguid';


GO





ALTER TABLE [Person].[BusinessEntityContact]
    ADD CONSTRAINT [DF_BusinessEntityContact_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityContact', @level2type = N'CONSTRAINT', @level2name = N'DF_BusinessEntityContact_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_BusinessEntityContact_rowguid]
    ON [Person].[BusinessEntityContact]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityContact', @level2type = N'INDEX', @level2name = N'AK_BusinessEntityContact_rowguid';


GO





CREATE NONCLUSTERED INDEX [IX_BusinessEntityContact_PersonID]
    ON [Person].[BusinessEntityContact]([PersonID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityContact', @level2type = N'INDEX', @level2name = N'IX_BusinessEntityContact_PersonID';


GO





CREATE NONCLUSTERED INDEX [IX_BusinessEntityContact_ContactTypeID]
    ON [Person].[BusinessEntityContact]([ContactTypeID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityContact', @level2type = N'INDEX', @level2name = N'IX_BusinessEntityContact_ContactTypeID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-reference table mapping stores, vendors, and employees to people', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'BusinessEntityContact';


GO





CREATE TABLE [Person].[ContactType] (
    [ContactTypeID] INT          IDENTITY (1, 1) NOT NULL,
    [Name]          [dbo].[Name] NOT NULL,
    [ModifiedDate]  DATETIME     NOT NULL
);


GO

ALTER TABLE [Person].[ContactType]
    ADD CONSTRAINT [PK_ContactType_ContactTypeID] PRIMARY KEY CLUSTERED ([ContactTypeID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'ContactType', @level2type = N'CONSTRAINT', @level2name = N'PK_ContactType_ContactTypeID';


GO





ALTER TABLE [Person].[ContactType]
    ADD CONSTRAINT [DF_ContactType_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'ContactType', @level2type = N'CONSTRAINT', @level2name = N'DF_ContactType_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_ContactType_Name]
    ON [Person].[ContactType]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'ContactType', @level2type = N'INDEX', @level2name = N'AK_ContactType_Name';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lookup table containing the types of business entity contacts.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'ContactType';


GO





CREATE TABLE [Person].[CountryRegion] (
    [CountryRegionCode] NVARCHAR (3) NOT NULL,
    [Name]              [dbo].[Name] NOT NULL,
    [ModifiedDate]      DATETIME     NOT NULL
);


GO

ALTER TABLE [Person].[CountryRegion]
    ADD CONSTRAINT [PK_CountryRegion_CountryRegionCode] PRIMARY KEY CLUSTERED ([CountryRegionCode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'CONSTRAINT', @level2name = N'PK_CountryRegion_CountryRegionCode';


GO





ALTER TABLE [Person].[CountryRegion]
    ADD CONSTRAINT [DF_CountryRegion_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'CONSTRAINT', @level2name = N'DF_CountryRegion_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_CountryRegion_Name]
    ON [Person].[CountryRegion]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'CountryRegion', @level2type = N'INDEX', @level2name = N'AK_CountryRegion_Name';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lookup table containing the ISO standard codes for countries and regions.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'TABLE', @level1name = N'CountryRegion';


GO





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






CREATE VIEW [Person].[vAdditionalContactInfo] 
AS 
SELECT 
    [BusinessEntityID] 
    ,[FirstName]
    ,[MiddleName]
    ,[LastName]
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:telephoneNumber)[1]/act:number', 'nvarchar(50)') AS [TelephoneNumber] 
    ,LTRIM(RTRIM([ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:telephoneNumber/act:SpecialInstructions/text())[1]', 'nvarchar(max)'))) AS [TelephoneSpecialInstructions] 
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes";
        (act:homePostalAddress/act:Street)[1]', 'nvarchar(50)') AS [Street] 
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:homePostalAddress/act:City)[1]', 'nvarchar(50)') AS [City] 
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:homePostalAddress/act:StateProvince)[1]', 'nvarchar(50)') AS [StateProvince] 
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:homePostalAddress/act:PostalCode)[1]', 'nvarchar(50)') AS [PostalCode] 
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:homePostalAddress/act:CountryRegion)[1]', 'nvarchar(50)') AS [CountryRegion] 
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:homePostalAddress/act:SpecialInstructions/text())[1]', 'nvarchar(max)') AS [HomeAddressSpecialInstructions] 
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:eMail/act:eMailAddress)[1]', 'nvarchar(128)') AS [EMailAddress] 
    ,LTRIM(RTRIM([ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:eMail/act:SpecialInstructions/text())[1]', 'nvarchar(max)'))) AS [EMailSpecialInstructions] 
    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 
        (act:eMail/act:SpecialInstructions/act:telephoneNumber/act:number)[1]', 'nvarchar(50)') AS [EMailTelephoneNumber] 
    ,[rowguid] 
    ,[ModifiedDate]
FROM [Person].[Person]
OUTER APPLY [AdditionalContactInfo].nodes(
    'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 
    /ci:AdditionalContactInfo') AS ContactInfo(ref) 
WHERE [AdditionalContactInfo] IS NOT NULL;
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Displays the contact name and content from each element in the xml column AdditionalContactInfo for that person.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'VIEW', @level1name = N'vAdditionalContactInfo';


GO






CREATE VIEW [Person].[vStateProvinceCountryRegion] 
WITH SCHEMABINDING 
AS 
SELECT 
    sp.[StateProvinceID] 
    ,sp.[StateProvinceCode] 
    ,sp.[IsOnlyStateProvinceFlag] 
    ,sp.[Name] AS [StateProvinceName] 
    ,sp.[TerritoryID] 
    ,cr.[CountryRegionCode] 
    ,cr.[Name] AS [CountryRegionName]
FROM [Person].[StateProvince] sp 
    INNER JOIN [Person].[CountryRegion] cr 
    ON sp.[CountryRegionCode] = cr.[CountryRegionCode];
GO

CREATE UNIQUE CLUSTERED INDEX [IX_vStateProvinceCountryRegion]
    ON [Person].[vStateProvinceCountryRegion]([StateProvinceID] ASC, [CountryRegionCode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Clustered index on the view vStateProvinceCountryRegion.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'VIEW', @level1name = N'vStateProvinceCountryRegion', @level2type = N'INDEX', @level2name = N'IX_vStateProvinceCountryRegion';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Joins StateProvince table with CountryRegion table.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'VIEW', @level1name = N'vStateProvinceCountryRegion';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains objects related to names and addresses of customers, vendors, and employees', @level0type = N'SCHEMA', @level0name = N'Person';


GO



