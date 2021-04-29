CREATE SCHEMA [Sales]
    AUTHORIZATION [dbo];


GO

CREATE XML SCHEMA COLLECTION [Sales].[StoreSurveySchemaCollection]
    AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey" elementFormDefault="qualified">
  <xsd:element name="StoreSurvey">
    <xsd:complexType>
      <xsd:complexContent>
        <xsd:restriction base="xsd:anyType">
          <xsd:sequence>
            <xsd:element name="ContactName" type="xsd:string" minOccurs="0" />
            <xsd:element name="JobTitle" type="xsd:string" minOccurs="0" />
            <xsd:element name="AnnualSales" type="xsd:decimal" minOccurs="0" />
            <xsd:element name="AnnualRevenue" type="xsd:decimal" minOccurs="0" />
            <xsd:element name="BankName" type="xsd:string" minOccurs="0" />
            <xsd:element name="BusinessType" type="t:BusinessType" minOccurs="0" />
            <xsd:element name="YearOpened" type="xsd:gYear" minOccurs="0" />
            <xsd:element name="Specialty" type="t:SpecialtyType" minOccurs="0" />
            <xsd:element name="SquareFeet" type="xsd:float" minOccurs="0" />
            <xsd:element name="Brands" type="t:BrandType" minOccurs="0" />
            <xsd:element name="Internet" type="t:InternetType" minOccurs="0" />
            <xsd:element name="NumberEmployees" type="xsd:int" minOccurs="0" />
            <xsd:element name="Comments" type="xsd:string" minOccurs="0" />
          </xsd:sequence>
        </xsd:restriction>
      </xsd:complexContent>
    </xsd:complexType>
  </xsd:element>
  <xsd:simpleType name="BrandType">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="AW" />
      <xsd:enumeration value="2" />
      <xsd:enumeration value="3" />
      <xsd:enumeration value="4+" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="BusinessType">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="BM" />
      <xsd:enumeration value="BS" />
      <xsd:enumeration value="D" />
      <xsd:enumeration value="OS" />
      <xsd:enumeration value="SGS" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="InternetType">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="56kb" />
      <xsd:enumeration value="ISDN" />
      <xsd:enumeration value="DSL" />
      <xsd:enumeration value="T1" />
      <xsd:enumeration value="T2" />
      <xsd:enumeration value="T3" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="SpecialtyType">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="Family" />
      <xsd:enumeration value="Kids" />
      <xsd:enumeration value="BMX" />
      <xsd:enumeration value="Touring" />
      <xsd:enumeration value="Road" />
      <xsd:enumeration value="Mountain" />
      <xsd:enumeration value="All" />
    </xsd:restriction>
  </xsd:simpleType>
</xsd:schema>';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Collection of XML schemas for the Demographics column in the Sales.Store table.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'XML SCHEMA COLLECTION', @level1name = N'StoreSurveySchemaCollection';


GO





CREATE TABLE [Sales].[SalesOrderHeaderSalesReason] (
    [SalesOrderID]  INT      NOT NULL,
    [SalesReasonID] INT      NOT NULL,
    [ModifiedDate]  DATETIME NOT NULL
);


GO

ALTER TABLE [Sales].[SalesOrderHeaderSalesReason]
    ADD CONSTRAINT [PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID] PRIMARY KEY CLUSTERED ([SalesOrderID] ASC, [SalesReasonID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeaderSalesReason', @level2type = N'CONSTRAINT', @level2name = N'PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID';


GO





ALTER TABLE [Sales].[SalesOrderHeaderSalesReason]
    ADD CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID] FOREIGN KEY ([SalesReasonID]) REFERENCES [Sales].[SalesReason] ([SalesReasonID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing SalesReason.SalesReasonID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeaderSalesReason', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID';


GO





ALTER TABLE [Sales].[SalesOrderHeaderSalesReason]
    ADD CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID] FOREIGN KEY ([SalesOrderID]) REFERENCES [Sales].[SalesOrderHeader] ([SalesOrderID]) ON DELETE CASCADE;


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing SalesOrderHeader.SalesOrderID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeaderSalesReason', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID';


GO





ALTER TABLE [Sales].[SalesOrderHeaderSalesReason]
    ADD CONSTRAINT [DF_SalesOrderHeaderSalesReason_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeaderSalesReason', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesOrderHeaderSalesReason_ModifiedDate';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-reference table mapping sales orders to sales reason codes.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeaderSalesReason';


GO





CREATE TABLE [Sales].[SalesPerson] (
    [BusinessEntityID] INT              NOT NULL,
    [TerritoryID]      INT              NULL,
    [SalesQuota]       MONEY            NULL,
    [Bonus]            MONEY            NOT NULL,
    [CommissionPct]    SMALLMONEY       NOT NULL,
    [SalesYTD]         MONEY            NOT NULL,
    [SalesLastYear]    MONEY            NOT NULL,
    [rowguid]          UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]     DATETIME         NOT NULL
);


GO

ALTER TABLE [Sales].[SalesPerson]
    ADD CONSTRAINT [PK_SalesPerson_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'CONSTRAINT', @level2name = N'PK_SalesPerson_BusinessEntityID';


GO





ALTER TABLE [Sales].[SalesPerson]
    ADD CONSTRAINT [FK_SalesPerson_Employee_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Employee.EmployeeID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesPerson_Employee_BusinessEntityID';


GO





ALTER TABLE [Sales].[SalesPerson]
    ADD CONSTRAINT [FK_SalesPerson_SalesTerritory_TerritoryID] FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing SalesTerritory.TerritoryID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesPerson_SalesTerritory_TerritoryID';


GO





ALTER TABLE [Sales].[SalesPerson]
    ADD CONSTRAINT [DF_SalesPerson_Bonus] DEFAULT ((0.00)) FOR [Bonus];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesPerson_Bonus';


GO





ALTER TABLE [Sales].[SalesPerson]
    ADD CONSTRAINT [DF_SalesPerson_CommissionPct] DEFAULT ((0.00)) FOR [CommissionPct];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesPerson_CommissionPct';


GO





ALTER TABLE [Sales].[SalesPerson]
    ADD CONSTRAINT [DF_SalesPerson_SalesYTD] DEFAULT ((0.00)) FOR [SalesYTD];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesPerson_SalesYTD';


GO





ALTER TABLE [Sales].[SalesPerson]
    ADD CONSTRAINT [DF_SalesPerson_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesPerson_ModifiedDate';


GO





ALTER TABLE [Sales].[SalesPerson]
    ADD CONSTRAINT [DF_SalesPerson_SalesLastYear] DEFAULT ((0.00)) FOR [SalesLastYear];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesPerson_SalesLastYear';


GO





ALTER TABLE [Sales].[SalesPerson]
    ADD CONSTRAINT [DF_SalesPerson_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesPerson_rowguid';


GO





ALTER TABLE [Sales].[SalesPerson]
    ADD CONSTRAINT [CK_SalesPerson_SalesLastYear] CHECK ([SalesLastYear]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [SalesLastYear] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesPerson_SalesLastYear';


GO





ALTER TABLE [Sales].[SalesPerson]
    ADD CONSTRAINT [CK_SalesPerson_SalesQuota] CHECK ([SalesQuota]>(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [SalesQuota] > (0.00)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesPerson_SalesQuota';


GO





ALTER TABLE [Sales].[SalesPerson]
    ADD CONSTRAINT [CK_SalesPerson_Bonus] CHECK ([Bonus]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [Bonus] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesPerson_Bonus';


GO





ALTER TABLE [Sales].[SalesPerson]
    ADD CONSTRAINT [CK_SalesPerson_SalesYTD] CHECK ([SalesYTD]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [SalesYTD] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesPerson_SalesYTD';


GO





ALTER TABLE [Sales].[SalesPerson]
    ADD CONSTRAINT [CK_SalesPerson_CommissionPct] CHECK ([CommissionPct]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [CommissionPct] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesPerson_CommissionPct';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesPerson_rowguid]
    ON [Sales].[SalesPerson]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPerson', @level2type = N'INDEX', @level2name = N'AK_SalesPerson_rowguid';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sales representative current information.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPerson';


GO





CREATE TABLE [Sales].[SalesPersonQuotaHistory] (
    [BusinessEntityID] INT              NOT NULL,
    [QuotaDate]        DATETIME         NOT NULL,
    [SalesQuota]       MONEY            NOT NULL,
    [rowguid]          UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]     DATETIME         NOT NULL
);


GO

ALTER TABLE [Sales].[SalesPersonQuotaHistory]
    ADD CONSTRAINT [PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC, [QuotaDate] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPersonQuotaHistory', @level2type = N'CONSTRAINT', @level2name = N'PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate';


GO





ALTER TABLE [Sales].[SalesPersonQuotaHistory]
    ADD CONSTRAINT [FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing SalesPerson.SalesPersonID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPersonQuotaHistory', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID';


GO





ALTER TABLE [Sales].[SalesPersonQuotaHistory]
    ADD CONSTRAINT [DF_SalesPersonQuotaHistory_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPersonQuotaHistory', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesPersonQuotaHistory_rowguid';


GO





ALTER TABLE [Sales].[SalesPersonQuotaHistory]
    ADD CONSTRAINT [DF_SalesPersonQuotaHistory_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPersonQuotaHistory', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesPersonQuotaHistory_ModifiedDate';


GO





ALTER TABLE [Sales].[SalesPersonQuotaHistory]
    ADD CONSTRAINT [CK_SalesPersonQuotaHistory_SalesQuota] CHECK ([SalesQuota]>(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [SalesQuota] > (0.00)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPersonQuotaHistory', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesPersonQuotaHistory_SalesQuota';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesPersonQuotaHistory_rowguid]
    ON [Sales].[SalesPersonQuotaHistory]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPersonQuotaHistory', @level2type = N'INDEX', @level2name = N'AK_SalesPersonQuotaHistory_rowguid';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sales performance tracking.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesPersonQuotaHistory';


GO





CREATE TABLE [Sales].[SalesReason] (
    [SalesReasonID] INT          IDENTITY (1, 1) NOT NULL,
    [Name]          [dbo].[Name] NOT NULL,
    [ReasonType]    [dbo].[Name] NOT NULL,
    [ModifiedDate]  DATETIME     NOT NULL
);


GO

ALTER TABLE [Sales].[SalesReason]
    ADD CONSTRAINT [PK_SalesReason_SalesReasonID] PRIMARY KEY CLUSTERED ([SalesReasonID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesReason', @level2type = N'CONSTRAINT', @level2name = N'PK_SalesReason_SalesReasonID';


GO





ALTER TABLE [Sales].[SalesReason]
    ADD CONSTRAINT [DF_SalesReason_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesReason', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesReason_ModifiedDate';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lookup table of customer purchase reasons.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesReason';


GO





CREATE TABLE [Sales].[SalesTaxRate] (
    [SalesTaxRateID]  INT              IDENTITY (1, 1) NOT NULL,
    [StateProvinceID] INT              NOT NULL,
    [TaxType]         TINYINT          NOT NULL,
    [TaxRate]         SMALLMONEY       NOT NULL,
    [Name]            [dbo].[Name]     NOT NULL,
    [rowguid]         UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]    DATETIME         NOT NULL
);


GO

ALTER TABLE [Sales].[SalesTaxRate]
    ADD CONSTRAINT [PK_SalesTaxRate_SalesTaxRateID] PRIMARY KEY CLUSTERED ([SalesTaxRateID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTaxRate', @level2type = N'CONSTRAINT', @level2name = N'PK_SalesTaxRate_SalesTaxRateID';


GO





ALTER TABLE [Sales].[SalesTaxRate]
    ADD CONSTRAINT [FK_SalesTaxRate_StateProvince_StateProvinceID] FOREIGN KEY ([StateProvinceID]) REFERENCES [Person].[StateProvince] ([StateProvinceID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing StateProvince.StateProvinceID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTaxRate', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesTaxRate_StateProvince_StateProvinceID';


GO





ALTER TABLE [Sales].[SalesTaxRate]
    ADD CONSTRAINT [DF_SalesTaxRate_TaxRate] DEFAULT ((0.00)) FOR [TaxRate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTaxRate', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesTaxRate_TaxRate';


GO





ALTER TABLE [Sales].[SalesTaxRate]
    ADD CONSTRAINT [DF_SalesTaxRate_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTaxRate', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesTaxRate_rowguid';


GO





ALTER TABLE [Sales].[SalesTaxRate]
    ADD CONSTRAINT [DF_SalesTaxRate_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTaxRate', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesTaxRate_ModifiedDate';


GO





ALTER TABLE [Sales].[SalesTaxRate]
    ADD CONSTRAINT [CK_SalesTaxRate_TaxType] CHECK ([TaxType]>=(1) AND [TaxType]<=(3));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [TaxType] BETWEEN (1) AND (3)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTaxRate', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesTaxRate_TaxType';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesTaxRate_StateProvinceID_TaxType]
    ON [Sales].[SalesTaxRate]([StateProvinceID] ASC, [TaxType] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTaxRate', @level2type = N'INDEX', @level2name = N'AK_SalesTaxRate_StateProvinceID_TaxType';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesTaxRate_rowguid]
    ON [Sales].[SalesTaxRate]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTaxRate', @level2type = N'INDEX', @level2name = N'AK_SalesTaxRate_rowguid';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tax rate lookup table.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTaxRate';


GO





CREATE TABLE [Sales].[PersonCreditCard] (
    [BusinessEntityID] INT      NOT NULL,
    [CreditCardID]     INT      NOT NULL,
    [ModifiedDate]     DATETIME NOT NULL
);


GO

ALTER TABLE [Sales].[PersonCreditCard]
    ADD CONSTRAINT [PK_PersonCreditCard_BusinessEntityID_CreditCardID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC, [CreditCardID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'PersonCreditCard', @level2type = N'CONSTRAINT', @level2name = N'PK_PersonCreditCard_BusinessEntityID_CreditCardID';


GO





ALTER TABLE [Sales].[PersonCreditCard]
    ADD CONSTRAINT [FK_PersonCreditCard_Person_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Person.BusinessEntityID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'PersonCreditCard', @level2type = N'CONSTRAINT', @level2name = N'FK_PersonCreditCard_Person_BusinessEntityID';


GO





ALTER TABLE [Sales].[PersonCreditCard]
    ADD CONSTRAINT [FK_PersonCreditCard_CreditCard_CreditCardID] FOREIGN KEY ([CreditCardID]) REFERENCES [Sales].[CreditCard] ([CreditCardID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing CreditCard.CreditCardID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'PersonCreditCard', @level2type = N'CONSTRAINT', @level2name = N'FK_PersonCreditCard_CreditCard_CreditCardID';


GO





ALTER TABLE [Sales].[PersonCreditCard]
    ADD CONSTRAINT [DF_PersonCreditCard_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'PersonCreditCard', @level2type = N'CONSTRAINT', @level2name = N'DF_PersonCreditCard_ModifiedDate';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-reference table mapping people to their credit card information in the CreditCard table. ', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'PersonCreditCard';


GO





CREATE TABLE [Sales].[SalesTerritory] (
    [TerritoryID]       INT              IDENTITY (1, 1) NOT NULL,
    [Name]              [dbo].[Name]     NOT NULL,
    [CountryRegionCode] NVARCHAR (3)     NOT NULL,
    [Group]             NVARCHAR (50)    NOT NULL,
    [SalesYTD]          MONEY            NOT NULL,
    [SalesLastYear]     MONEY            NOT NULL,
    [CostYTD]           MONEY            NOT NULL,
    [CostLastYear]      MONEY            NOT NULL,
    [rowguid]           UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]      DATETIME         NOT NULL
);


GO

ALTER TABLE [Sales].[SalesTerritory]
    ADD CONSTRAINT [PK_SalesTerritory_TerritoryID] PRIMARY KEY CLUSTERED ([TerritoryID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritory', @level2type = N'CONSTRAINT', @level2name = N'PK_SalesTerritory_TerritoryID';


GO





ALTER TABLE [Sales].[SalesTerritory]
    ADD CONSTRAINT [FK_SalesTerritory_CountryRegion_CountryRegionCode] FOREIGN KEY ([CountryRegionCode]) REFERENCES [Person].[CountryRegion] ([CountryRegionCode]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing CountryRegion.CountryRegionCode.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritory', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesTerritory_CountryRegion_CountryRegionCode';


GO





ALTER TABLE [Sales].[SalesTerritory]
    ADD CONSTRAINT [DF_SalesTerritory_SalesYTD] DEFAULT ((0.00)) FOR [SalesYTD];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritory', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesTerritory_SalesYTD';


GO





ALTER TABLE [Sales].[SalesTerritory]
    ADD CONSTRAINT [DF_SalesTerritory_SalesLastYear] DEFAULT ((0.00)) FOR [SalesLastYear];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritory', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesTerritory_SalesLastYear';


GO





ALTER TABLE [Sales].[SalesTerritory]
    ADD CONSTRAINT [DF_SalesTerritory_CostYTD] DEFAULT ((0.00)) FOR [CostYTD];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritory', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesTerritory_CostYTD';


GO





ALTER TABLE [Sales].[SalesTerritory]
    ADD CONSTRAINT [DF_SalesTerritory_CostLastYear] DEFAULT ((0.00)) FOR [CostLastYear];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritory', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesTerritory_CostLastYear';


GO





ALTER TABLE [Sales].[SalesTerritory]
    ADD CONSTRAINT [DF_SalesTerritory_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritory', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesTerritory_rowguid';


GO





ALTER TABLE [Sales].[SalesTerritory]
    ADD CONSTRAINT [DF_SalesTerritory_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritory', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesTerritory_ModifiedDate';


GO





ALTER TABLE [Sales].[SalesTerritory]
    ADD CONSTRAINT [CK_SalesTerritory_SalesYTD] CHECK ([SalesYTD]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [SalesYTD] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritory', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesTerritory_SalesYTD';


GO





ALTER TABLE [Sales].[SalesTerritory]
    ADD CONSTRAINT [CK_SalesTerritory_SalesLastYear] CHECK ([SalesLastYear]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [SalesLastYear] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritory', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesTerritory_SalesLastYear';


GO





ALTER TABLE [Sales].[SalesTerritory]
    ADD CONSTRAINT [CK_SalesTerritory_CostLastYear] CHECK ([CostLastYear]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [CostLastYear] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritory', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesTerritory_CostLastYear';


GO





ALTER TABLE [Sales].[SalesTerritory]
    ADD CONSTRAINT [CK_SalesTerritory_CostYTD] CHECK ([CostYTD]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [CostYTD] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritory', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesTerritory_CostYTD';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesTerritory_Name]
    ON [Sales].[SalesTerritory]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritory', @level2type = N'INDEX', @level2name = N'AK_SalesTerritory_Name';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesTerritory_rowguid]
    ON [Sales].[SalesTerritory]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritory', @level2type = N'INDEX', @level2name = N'AK_SalesTerritory_rowguid';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sales territory lookup table.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritory';


GO





CREATE TABLE [Sales].[SalesTerritoryHistory] (
    [BusinessEntityID] INT              NOT NULL,
    [TerritoryID]      INT              NOT NULL,
    [StartDate]        DATETIME         NOT NULL,
    [EndDate]          DATETIME         NULL,
    [rowguid]          UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]     DATETIME         NOT NULL
);


GO

ALTER TABLE [Sales].[SalesTerritoryHistory]
    ADD CONSTRAINT [PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC, [StartDate] ASC, [TerritoryID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritoryHistory', @level2type = N'CONSTRAINT', @level2name = N'PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID';


GO





ALTER TABLE [Sales].[SalesTerritoryHistory]
    ADD CONSTRAINT [FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing SalesPerson.SalesPersonID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritoryHistory', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID';


GO





ALTER TABLE [Sales].[SalesTerritoryHistory]
    ADD CONSTRAINT [FK_SalesTerritoryHistory_SalesTerritory_TerritoryID] FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing SalesTerritory.TerritoryID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritoryHistory', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesTerritoryHistory_SalesTerritory_TerritoryID';


GO





ALTER TABLE [Sales].[SalesTerritoryHistory]
    ADD CONSTRAINT [DF_SalesTerritoryHistory_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritoryHistory', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesTerritoryHistory_rowguid';


GO





ALTER TABLE [Sales].[SalesTerritoryHistory]
    ADD CONSTRAINT [DF_SalesTerritoryHistory_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritoryHistory', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesTerritoryHistory_ModifiedDate';


GO





ALTER TABLE [Sales].[SalesTerritoryHistory]
    ADD CONSTRAINT [CK_SalesTerritoryHistory_EndDate] CHECK ([EndDate]>=[StartDate] OR [EndDate] IS NULL);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NULL', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritoryHistory', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesTerritoryHistory_EndDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesTerritoryHistory_rowguid]
    ON [Sales].[SalesTerritoryHistory]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritoryHistory', @level2type = N'INDEX', @level2name = N'AK_SalesTerritoryHistory_rowguid';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sales representative transfers to other sales territories.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesTerritoryHistory';


GO





CREATE TABLE [Sales].[ShoppingCartItem] (
    [ShoppingCartItemID] INT           IDENTITY (1, 1) NOT NULL,
    [ShoppingCartID]     NVARCHAR (50) NOT NULL,
    [Quantity]           INT           NOT NULL,
    [ProductID]          INT           NOT NULL,
    [DateCreated]        DATETIME      NOT NULL,
    [ModifiedDate]       DATETIME      NOT NULL
);


GO

ALTER TABLE [Sales].[ShoppingCartItem]
    ADD CONSTRAINT [PK_ShoppingCartItem_ShoppingCartItemID] PRIMARY KEY CLUSTERED ([ShoppingCartItemID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'ShoppingCartItem', @level2type = N'CONSTRAINT', @level2name = N'PK_ShoppingCartItem_ShoppingCartItemID';


GO





ALTER TABLE [Sales].[ShoppingCartItem]
    ADD CONSTRAINT [FK_ShoppingCartItem_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Product.ProductID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'ShoppingCartItem', @level2type = N'CONSTRAINT', @level2name = N'FK_ShoppingCartItem_Product_ProductID';


GO





ALTER TABLE [Sales].[ShoppingCartItem]
    ADD CONSTRAINT [DF_ShoppingCartItem_DateCreated] DEFAULT (getdate()) FOR [DateCreated];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'ShoppingCartItem', @level2type = N'CONSTRAINT', @level2name = N'DF_ShoppingCartItem_DateCreated';


GO





ALTER TABLE [Sales].[ShoppingCartItem]
    ADD CONSTRAINT [DF_ShoppingCartItem_Quantity] DEFAULT ((1)) FOR [Quantity];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 1', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'ShoppingCartItem', @level2type = N'CONSTRAINT', @level2name = N'DF_ShoppingCartItem_Quantity';


GO





ALTER TABLE [Sales].[ShoppingCartItem]
    ADD CONSTRAINT [DF_ShoppingCartItem_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'ShoppingCartItem', @level2type = N'CONSTRAINT', @level2name = N'DF_ShoppingCartItem_ModifiedDate';


GO





ALTER TABLE [Sales].[ShoppingCartItem]
    ADD CONSTRAINT [CK_ShoppingCartItem_Quantity] CHECK ([Quantity]>=(1));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [Quantity] >= (1)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'ShoppingCartItem', @level2type = N'CONSTRAINT', @level2name = N'CK_ShoppingCartItem_Quantity';


GO





CREATE NONCLUSTERED INDEX [IX_ShoppingCartItem_ShoppingCartID_ProductID]
    ON [Sales].[ShoppingCartItem]([ShoppingCartID] ASC, [ProductID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'ShoppingCartItem', @level2type = N'INDEX', @level2name = N'IX_ShoppingCartItem_ShoppingCartID_ProductID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains online customer orders until the order is submitted or cancelled.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'ShoppingCartItem';


GO





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
    ADD CONSTRAINT [PK_SpecialOffer_SpecialOfferID] PRIMARY KEY CLUSTERED ([SpecialOfferID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'PK_SpecialOffer_SpecialOfferID';


GO





ALTER TABLE [Sales].[SpecialOffer]
    ADD CONSTRAINT [DF_SpecialOffer_MinQty] DEFAULT ((0)) FOR [MinQty];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'DF_SpecialOffer_MinQty';


GO





ALTER TABLE [Sales].[SpecialOffer]
    ADD CONSTRAINT [DF_SpecialOffer_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'DF_SpecialOffer_rowguid';


GO





ALTER TABLE [Sales].[SpecialOffer]
    ADD CONSTRAINT [DF_SpecialOffer_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'DF_SpecialOffer_ModifiedDate';


GO





ALTER TABLE [Sales].[SpecialOffer]
    ADD CONSTRAINT [DF_SpecialOffer_DiscountPct] DEFAULT ((0.00)) FOR [DiscountPct];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'DF_SpecialOffer_DiscountPct';


GO





ALTER TABLE [Sales].[SpecialOffer]
    ADD CONSTRAINT [CK_SpecialOffer_EndDate] CHECK ([EndDate]>=[StartDate]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [EndDate] >= [StartDate]', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'CK_SpecialOffer_EndDate';


GO





ALTER TABLE [Sales].[SpecialOffer]
    ADD CONSTRAINT [CK_SpecialOffer_DiscountPct] CHECK ([DiscountPct]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [DiscountPct] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'CK_SpecialOffer_DiscountPct';


GO





ALTER TABLE [Sales].[SpecialOffer]
    ADD CONSTRAINT [CK_SpecialOffer_MinQty] CHECK ([MinQty]>=(0));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [MinQty] >= (0)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'CK_SpecialOffer_MinQty';


GO





ALTER TABLE [Sales].[SpecialOffer]
    ADD CONSTRAINT [CK_SpecialOffer_MaxQty] CHECK ([MaxQty]>=(0));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [MaxQty] >= (0)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'CONSTRAINT', @level2name = N'CK_SpecialOffer_MaxQty';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_SpecialOffer_rowguid]
    ON [Sales].[SpecialOffer]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer', @level2type = N'INDEX', @level2name = N'AK_SpecialOffer_rowguid';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sale discounts lookup table.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOffer';


GO





CREATE TABLE [Sales].[SpecialOfferProduct] (
    [SpecialOfferID] INT              NOT NULL,
    [ProductID]      INT              NOT NULL,
    [rowguid]        UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]   DATETIME         NOT NULL
);


GO

ALTER TABLE [Sales].[SpecialOfferProduct]
    ADD CONSTRAINT [PK_SpecialOfferProduct_SpecialOfferID_ProductID] PRIMARY KEY CLUSTERED ([SpecialOfferID] ASC, [ProductID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOfferProduct', @level2type = N'CONSTRAINT', @level2name = N'PK_SpecialOfferProduct_SpecialOfferID_ProductID';


GO





ALTER TABLE [Sales].[SpecialOfferProduct]
    ADD CONSTRAINT [FK_SpecialOfferProduct_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Product.ProductID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOfferProduct', @level2type = N'CONSTRAINT', @level2name = N'FK_SpecialOfferProduct_Product_ProductID';


GO





ALTER TABLE [Sales].[SpecialOfferProduct]
    ADD CONSTRAINT [FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID] FOREIGN KEY ([SpecialOfferID]) REFERENCES [Sales].[SpecialOffer] ([SpecialOfferID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing SpecialOffer.SpecialOfferID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOfferProduct', @level2type = N'CONSTRAINT', @level2name = N'FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID';


GO





ALTER TABLE [Sales].[SpecialOfferProduct]
    ADD CONSTRAINT [DF_SpecialOfferProduct_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOfferProduct', @level2type = N'CONSTRAINT', @level2name = N'DF_SpecialOfferProduct_rowguid';


GO





ALTER TABLE [Sales].[SpecialOfferProduct]
    ADD CONSTRAINT [DF_SpecialOfferProduct_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOfferProduct', @level2type = N'CONSTRAINT', @level2name = N'DF_SpecialOfferProduct_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_SpecialOfferProduct_rowguid]
    ON [Sales].[SpecialOfferProduct]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOfferProduct', @level2type = N'INDEX', @level2name = N'AK_SpecialOfferProduct_rowguid';


GO





CREATE NONCLUSTERED INDEX [IX_SpecialOfferProduct_ProductID]
    ON [Sales].[SpecialOfferProduct]([ProductID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOfferProduct', @level2type = N'INDEX', @level2name = N'IX_SpecialOfferProduct_ProductID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-reference table mapping products to special offer discounts.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SpecialOfferProduct';


GO





CREATE TABLE [Sales].[Store] (
    [BusinessEntityID] INT                                                NOT NULL,
    [Name]             [dbo].[Name]                                       NOT NULL,
    [SalesPersonID]    INT                                                NULL,
    [Demographics]     XML(CONTENT [Sales].[StoreSurveySchemaCollection]) NULL,
    [rowguid]          UNIQUEIDENTIFIER                                   ROWGUIDCOL NOT NULL,
    [ModifiedDate]     DATETIME                                           NOT NULL
);


GO

ALTER TABLE [Sales].[Store]
    ADD CONSTRAINT [PK_Store_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store', @level2type = N'CONSTRAINT', @level2name = N'PK_Store_BusinessEntityID';


GO





ALTER TABLE [Sales].[Store]
    ADD CONSTRAINT [FK_Store_BusinessEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing BusinessEntity.BusinessEntityID', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store', @level2type = N'CONSTRAINT', @level2name = N'FK_Store_BusinessEntity_BusinessEntityID';


GO





ALTER TABLE [Sales].[Store]
    ADD CONSTRAINT [FK_Store_SalesPerson_SalesPersonID] FOREIGN KEY ([SalesPersonID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing SalesPerson.SalesPersonID', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store', @level2type = N'CONSTRAINT', @level2name = N'FK_Store_SalesPerson_SalesPersonID';


GO





ALTER TABLE [Sales].[Store]
    ADD CONSTRAINT [DF_Store_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store', @level2type = N'CONSTRAINT', @level2name = N'DF_Store_ModifiedDate';


GO





ALTER TABLE [Sales].[Store]
    ADD CONSTRAINT [DF_Store_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store', @level2type = N'CONSTRAINT', @level2name = N'DF_Store_rowguid';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Store_rowguid]
    ON [Sales].[Store]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store', @level2type = N'INDEX', @level2name = N'AK_Store_rowguid';


GO





CREATE NONCLUSTERED INDEX [IX_Store_SalesPersonID]
    ON [Sales].[Store]([SalesPersonID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store', @level2type = N'INDEX', @level2name = N'IX_Store_SalesPersonID';


GO





CREATE PRIMARY XML INDEX [PXML_Store_Demographics]
    ON [Sales].[Store]([Demographics])
    WITH (PAD_INDEX = OFF);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary XML index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store', @level2type = N'INDEX', @level2name = N'PXML_Store_Demographics';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customers (resellers) of Adventure Works products.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Store';


GO





CREATE TABLE [Sales].[CountryRegionCurrency] (
    [CountryRegionCode] NVARCHAR (3) NOT NULL,
    [CurrencyCode]      NCHAR (3)    NOT NULL,
    [ModifiedDate]      DATETIME     NOT NULL
);


GO

ALTER TABLE [Sales].[CountryRegionCurrency]
    ADD CONSTRAINT [PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode] PRIMARY KEY CLUSTERED ([CountryRegionCode] ASC, [CurrencyCode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CountryRegionCurrency', @level2type = N'CONSTRAINT', @level2name = N'PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode';


GO





ALTER TABLE [Sales].[CountryRegionCurrency]
    ADD CONSTRAINT [FK_CountryRegionCurrency_CountryRegion_CountryRegionCode] FOREIGN KEY ([CountryRegionCode]) REFERENCES [Person].[CountryRegion] ([CountryRegionCode]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing CountryRegion.CountryRegionCode.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CountryRegionCurrency', @level2type = N'CONSTRAINT', @level2name = N'FK_CountryRegionCurrency_CountryRegion_CountryRegionCode';


GO





ALTER TABLE [Sales].[CountryRegionCurrency]
    ADD CONSTRAINT [FK_CountryRegionCurrency_Currency_CurrencyCode] FOREIGN KEY ([CurrencyCode]) REFERENCES [Sales].[Currency] ([CurrencyCode]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Currency.CurrencyCode.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CountryRegionCurrency', @level2type = N'CONSTRAINT', @level2name = N'FK_CountryRegionCurrency_Currency_CurrencyCode';


GO





ALTER TABLE [Sales].[CountryRegionCurrency]
    ADD CONSTRAINT [DF_CountryRegionCurrency_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CountryRegionCurrency', @level2type = N'CONSTRAINT', @level2name = N'DF_CountryRegionCurrency_ModifiedDate';


GO





CREATE NONCLUSTERED INDEX [IX_CountryRegionCurrency_CurrencyCode]
    ON [Sales].[CountryRegionCurrency]([CurrencyCode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CountryRegionCurrency', @level2type = N'INDEX', @level2name = N'IX_CountryRegionCurrency_CurrencyCode';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-reference table mapping ISO currency codes to a country or region.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CountryRegionCurrency';


GO





CREATE TABLE [Sales].[CreditCard] (
    [CreditCardID] INT           IDENTITY (1, 1) NOT NULL,
    [CardType]     NVARCHAR (50) NOT NULL,
    [CardNumber]   NVARCHAR (25) NOT NULL,
    [ExpMonth]     TINYINT       NOT NULL,
    [ExpYear]      SMALLINT      NOT NULL,
    [ModifiedDate] DATETIME      NOT NULL
);


GO

ALTER TABLE [Sales].[CreditCard]
    ADD CONSTRAINT [PK_CreditCard_CreditCardID] PRIMARY KEY CLUSTERED ([CreditCardID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CreditCard', @level2type = N'CONSTRAINT', @level2name = N'PK_CreditCard_CreditCardID';


GO





ALTER TABLE [Sales].[CreditCard]
    ADD CONSTRAINT [DF_CreditCard_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CreditCard', @level2type = N'CONSTRAINT', @level2name = N'DF_CreditCard_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_CreditCard_CardNumber]
    ON [Sales].[CreditCard]([CardNumber] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CreditCard', @level2type = N'INDEX', @level2name = N'AK_CreditCard_CardNumber';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer credit card information.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'CreditCard';


GO





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





CREATE TABLE [Sales].[Customer] (
    [CustomerID]    INT              IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [PersonID]      INT              NULL,
    [StoreID]       INT              NULL,
    [TerritoryID]   INT              NULL,
    [AccountNumber] AS               (isnull('AW'+[dbo].[ufnLeadingZeros]([CustomerID]),'')),
    [rowguid]       UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]  DATETIME         NOT NULL
);


GO

ALTER TABLE [Sales].[Customer]
    ADD CONSTRAINT [PK_Customer_CustomerID] PRIMARY KEY CLUSTERED ([CustomerID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'CONSTRAINT', @level2name = N'PK_Customer_CustomerID';


GO





ALTER TABLE [Sales].[Customer]
    ADD CONSTRAINT [FK_Customer_Person_PersonID] FOREIGN KEY ([PersonID]) REFERENCES [Person].[Person] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Person.BusinessEntityID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'CONSTRAINT', @level2name = N'FK_Customer_Person_PersonID';


GO





ALTER TABLE [Sales].[Customer]
    ADD CONSTRAINT [FK_Customer_Store_StoreID] FOREIGN KEY ([StoreID]) REFERENCES [Sales].[Store] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Store.BusinessEntityID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'CONSTRAINT', @level2name = N'FK_Customer_Store_StoreID';


GO





ALTER TABLE [Sales].[Customer]
    ADD CONSTRAINT [FK_Customer_SalesTerritory_TerritoryID] FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing SalesTerritory.TerritoryID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'CONSTRAINT', @level2name = N'FK_Customer_SalesTerritory_TerritoryID';


GO





ALTER TABLE [Sales].[Customer]
    ADD CONSTRAINT [DF_Customer_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'CONSTRAINT', @level2name = N'DF_Customer_ModifiedDate';


GO





ALTER TABLE [Sales].[Customer]
    ADD CONSTRAINT [DF_Customer_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'CONSTRAINT', @level2name = N'DF_Customer_rowguid';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Customer_rowguid]
    ON [Sales].[Customer]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'INDEX', @level2name = N'AK_Customer_rowguid';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Customer_AccountNumber]
    ON [Sales].[Customer]([AccountNumber] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'INDEX', @level2name = N'AK_Customer_AccountNumber';


GO





CREATE NONCLUSTERED INDEX [IX_Customer_TerritoryID]
    ON [Sales].[Customer]([TerritoryID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customer', @level2type = N'INDEX', @level2name = N'IX_Customer_TerritoryID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Current customer information. Also see the Person and Store tables.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Customer';


GO





CREATE TABLE [Sales].[SalesOrderDetail] (
    [SalesOrderID]          INT              NOT NULL,
    [SalesOrderDetailID]    INT              IDENTITY (1, 1) NOT NULL,
    [CarrierTrackingNumber] NVARCHAR (25)    NULL,
    [OrderQty]              SMALLINT         NOT NULL,
    [ProductID]             INT              NOT NULL,
    [SpecialOfferID]        INT              NOT NULL,
    [UnitPrice]             MONEY            NOT NULL,
    [UnitPriceDiscount]     MONEY            NOT NULL,
    [LineTotal]             AS               (isnull(([UnitPrice]*((1.0)-[UnitPriceDiscount]))*[OrderQty],(0.0))),
    [rowguid]               UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]          DATETIME         NOT NULL
);


GO

ALTER TABLE [Sales].[SalesOrderDetail]
    ADD CONSTRAINT [PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID] PRIMARY KEY CLUSTERED ([SalesOrderID] ASC, [SalesOrderDetailID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderDetail', @level2type = N'CONSTRAINT', @level2name = N'PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID';


GO





ALTER TABLE [Sales].[SalesOrderDetail]
    ADD CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID] FOREIGN KEY ([SalesOrderID]) REFERENCES [Sales].[SalesOrderHeader] ([SalesOrderID]) ON DELETE CASCADE;


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing SalesOrderHeader.PurchaseOrderID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderDetail', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID';


GO





ALTER TABLE [Sales].[SalesOrderDetail]
    ADD CONSTRAINT [FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID] FOREIGN KEY ([SpecialOfferID], [ProductID]) REFERENCES [Sales].[SpecialOfferProduct] ([SpecialOfferID], [ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing SpecialOfferProduct.SpecialOfferIDProductID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderDetail', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID';


GO





ALTER TABLE [Sales].[SalesOrderDetail]
    ADD CONSTRAINT [DF_SalesOrderDetail_UnitPriceDiscount] DEFAULT ((0.0)) FOR [UnitPriceDiscount];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderDetail', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesOrderDetail_UnitPriceDiscount';


GO





ALTER TABLE [Sales].[SalesOrderDetail]
    ADD CONSTRAINT [DF_SalesOrderDetail_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderDetail', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesOrderDetail_rowguid';


GO





ALTER TABLE [Sales].[SalesOrderDetail]
    ADD CONSTRAINT [DF_SalesOrderDetail_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderDetail', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesOrderDetail_ModifiedDate';


GO





ALTER TABLE [Sales].[SalesOrderDetail]
    ADD CONSTRAINT [CK_SalesOrderDetail_OrderQty] CHECK ([OrderQty]>(0));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [OrderQty] > (0)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderDetail', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesOrderDetail_OrderQty';


GO





ALTER TABLE [Sales].[SalesOrderDetail]
    ADD CONSTRAINT [CK_SalesOrderDetail_UnitPrice] CHECK ([UnitPrice]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [UnitPrice] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderDetail', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesOrderDetail_UnitPrice';


GO





ALTER TABLE [Sales].[SalesOrderDetail]
    ADD CONSTRAINT [CK_SalesOrderDetail_UnitPriceDiscount] CHECK ([UnitPriceDiscount]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [UnitPriceDiscount] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderDetail', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesOrderDetail_UnitPriceDiscount';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesOrderDetail_rowguid]
    ON [Sales].[SalesOrderDetail]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderDetail', @level2type = N'INDEX', @level2name = N'AK_SalesOrderDetail_rowguid';


GO





CREATE NONCLUSTERED INDEX [IX_SalesOrderDetail_ProductID]
    ON [Sales].[SalesOrderDetail]([ProductID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderDetail', @level2type = N'INDEX', @level2name = N'IX_SalesOrderDetail_ProductID';


GO






CREATE TRIGGER [Sales].[iduSalesOrderDetail] ON [Sales].[SalesOrderDetail] 
AFTER INSERT, DELETE, UPDATE AS 
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0 
        RETURN;

    SET NOCOUNT ON;

    BEGIN TRY
        -- If inserting or updating these columns
        IF UPDATE([ProductID]) OR UPDATE([OrderQty]) OR UPDATE([UnitPrice]) OR UPDATE([UnitPriceDiscount]) 
        -- Insert record into TransactionHistory
        BEGIN
            INSERT INTO [Production].[TransactionHistory]
                ([ProductID]
                ,[ReferenceOrderID]
                ,[ReferenceOrderLineID]
                ,[TransactionType]
                ,[TransactionDate]
                ,[Quantity]
                ,[ActualCost])
            SELECT 
                inserted.[ProductID]
                ,inserted.[SalesOrderID]
                ,inserted.[SalesOrderDetailID]
                ,'S'
                ,GETDATE()
                ,inserted.[OrderQty]
                ,inserted.[UnitPrice]
            FROM inserted 
                INNER JOIN [Sales].[SalesOrderHeader] 
                ON inserted.[SalesOrderID] = [Sales].[SalesOrderHeader].[SalesOrderID];

            UPDATE [Person].[Person] 
            SET [Demographics].modify('declare default element namespace 
                "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
                replace value of (/IndividualSurvey/TotalPurchaseYTD)[1] 
                with data(/IndividualSurvey/TotalPurchaseYTD)[1] + sql:column ("inserted.LineTotal")') 
            FROM inserted 
                INNER JOIN [Sales].[SalesOrderHeader] AS SOH
                ON inserted.[SalesOrderID] = SOH.[SalesOrderID] 
                INNER JOIN [Sales].[Customer] AS C
                ON SOH.[CustomerID] = C.[CustomerID]
            WHERE C.[PersonID] = [Person].[Person].[BusinessEntityID];
        END;

        -- Update SubTotal in SalesOrderHeader record. Note that this causes the 
        -- SalesOrderHeader trigger to fire which will update the RevisionNumber.
        UPDATE [Sales].[SalesOrderHeader]
        SET [Sales].[SalesOrderHeader].[SubTotal] = 
            (SELECT SUM([Sales].[SalesOrderDetail].[LineTotal])
                FROM [Sales].[SalesOrderDetail]
                WHERE [Sales].[SalesOrderHeader].[SalesOrderID] = [Sales].[SalesOrderDetail].[SalesOrderID])
        WHERE [Sales].[SalesOrderHeader].[SalesOrderID] IN (SELECT inserted.[SalesOrderID] FROM inserted);

        UPDATE [Person].[Person] 
        SET [Demographics].modify('declare default element namespace 
            "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
            replace value of (/IndividualSurvey/TotalPurchaseYTD)[1] 
            with data(/IndividualSurvey/TotalPurchaseYTD)[1] - sql:column("deleted.LineTotal")') 
        FROM deleted 
            INNER JOIN [Sales].[SalesOrderHeader] 
            ON deleted.[SalesOrderID] = [Sales].[SalesOrderHeader].[SalesOrderID] 
            INNER JOIN [Sales].[Customer]
            ON [Sales].[Customer].[CustomerID] = [Sales].[SalesOrderHeader].[CustomerID]
        WHERE [Sales].[Customer].[PersonID] = [Person].[Person].[BusinessEntityID];
    END TRY
    BEGIN CATCH
        EXECUTE [dbo].[uspPrintError];

        -- Rollback any active or uncommittable transactions before
        -- inserting information in the ErrorLog
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'AFTER INSERT, DELETE, UPDATE trigger that inserts a row in the TransactionHistory table, updates ModifiedDate in SalesOrderDetail and updates the SalesOrderHeader.SubTotal column.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderDetail', @level2type = N'TRIGGER', @level2name = N'iduSalesOrderDetail';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Individual products associated with a specific sales order. See SalesOrderHeader.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderDetail';


GO





CREATE TABLE [Sales].[SalesOrderHeader] (
    [SalesOrderID]           INT                   IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [RevisionNumber]         TINYINT               NOT NULL,
    [OrderDate]              DATETIME              NOT NULL,
    [DueDate]                DATETIME              NOT NULL,
    [ShipDate]               DATETIME              NULL,
    [Status]                 TINYINT               NOT NULL,
    [OnlineOrderFlag]        [dbo].[Flag]          NOT NULL,
    [SalesOrderNumber]       AS                    (isnull(N'SO'+CONVERT([nvarchar](23),[SalesOrderID]),N'*** ERROR ***')),
    [PurchaseOrderNumber]    [dbo].[OrderNumber]   NULL,
    [AccountNumber]          [dbo].[AccountNumber] NULL,
    [CustomerID]             INT                   NOT NULL,
    [SalesPersonID]          INT                   NULL,
    [TerritoryID]            INT                   NULL,
    [BillToAddressID]        INT                   NOT NULL,
    [ShipToAddressID]        INT                   NOT NULL,
    [ShipMethodID]           INT                   NOT NULL,
    [CreditCardID]           INT                   NULL,
    [CreditCardApprovalCode] VARCHAR (15)          NULL,
    [CurrencyRateID]         INT                   NULL,
    [SubTotal]               MONEY                 NOT NULL,
    [TaxAmt]                 MONEY                 NOT NULL,
    [Freight]                MONEY                 NOT NULL,
    [TotalDue]               AS                    (isnull(([SubTotal]+[TaxAmt])+[Freight],(0))),
    [Comment]                NVARCHAR (128)        NULL,
    [rowguid]                UNIQUEIDENTIFIER      ROWGUIDCOL NOT NULL,
    [ModifiedDate]           DATETIME              NOT NULL
);


GO

ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [PK_SalesOrderHeader_SalesOrderID] PRIMARY KEY CLUSTERED ([SalesOrderID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'PK_SalesOrderHeader_SalesOrderID';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [FK_SalesOrderHeader_Address_BillToAddressID] FOREIGN KEY ([BillToAddressID]) REFERENCES [Person].[Address] ([AddressID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Address.AddressID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesOrderHeader_Address_BillToAddressID';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [FK_SalesOrderHeader_Address_ShipToAddressID] FOREIGN KEY ([ShipToAddressID]) REFERENCES [Person].[Address] ([AddressID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Address.AddressID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesOrderHeader_Address_ShipToAddressID';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [FK_SalesOrderHeader_CreditCard_CreditCardID] FOREIGN KEY ([CreditCardID]) REFERENCES [Sales].[CreditCard] ([CreditCardID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing CreditCard.CreditCardID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesOrderHeader_CreditCard_CreditCardID';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [FK_SalesOrderHeader_CurrencyRate_CurrencyRateID] FOREIGN KEY ([CurrencyRateID]) REFERENCES [Sales].[CurrencyRate] ([CurrencyRateID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing CurrencyRate.CurrencyRateID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesOrderHeader_CurrencyRate_CurrencyRateID';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID] FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customer] ([CustomerID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Customer.CustomerID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesOrderHeader_Customer_CustomerID';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [FK_SalesOrderHeader_SalesPerson_SalesPersonID] FOREIGN KEY ([SalesPersonID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing SalesPerson.SalesPersonID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesOrderHeader_SalesPerson_SalesPersonID';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [FK_SalesOrderHeader_ShipMethod_ShipMethodID] FOREIGN KEY ([ShipMethodID]) REFERENCES [Purchasing].[ShipMethod] ([ShipMethodID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing ShipMethod.ShipMethodID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesOrderHeader_ShipMethod_ShipMethodID';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [FK_SalesOrderHeader_SalesTerritory_TerritoryID] FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing SalesTerritory.TerritoryID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'FK_SalesOrderHeader_SalesTerritory_TerritoryID';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_SubTotal] DEFAULT ((0.00)) FOR [SubTotal];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesOrderHeader_SubTotal';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_TaxAmt] DEFAULT ((0.00)) FOR [TaxAmt];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesOrderHeader_TaxAmt';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_Freight] DEFAULT ((0.00)) FOR [Freight];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesOrderHeader_Freight';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesOrderHeader_rowguid';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesOrderHeader_ModifiedDate';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_OnlineOrderFlag] DEFAULT ((1)) FOR [OnlineOrderFlag];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 1 (TRUE)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesOrderHeader_OnlineOrderFlag';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_Status] DEFAULT ((1)) FOR [Status];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 1', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesOrderHeader_Status';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_OrderDate] DEFAULT (getdate()) FOR [OrderDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesOrderHeader_OrderDate';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_RevisionNumber] DEFAULT ((0)) FOR [RevisionNumber];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'DF_SalesOrderHeader_RevisionNumber';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [CK_SalesOrderHeader_DueDate] CHECK ([DueDate]>=[OrderDate]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [DueDate] >= [OrderDate]', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesOrderHeader_DueDate';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [CK_SalesOrderHeader_ShipDate] CHECK ([ShipDate]>=[OrderDate] OR [ShipDate] IS NULL);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [ShipDate] >= [OrderDate] OR [ShipDate] IS NULL', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesOrderHeader_ShipDate';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [CK_SalesOrderHeader_SubTotal] CHECK ([SubTotal]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [SubTotal] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesOrderHeader_SubTotal';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [CK_SalesOrderHeader_Status] CHECK ([Status]>=(0) AND [Status]<=(8));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [Status] BETWEEN (0) AND (8)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesOrderHeader_Status';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [CK_SalesOrderHeader_Freight] CHECK ([Freight]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [Freight] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesOrderHeader_Freight';


GO





ALTER TABLE [Sales].[SalesOrderHeader]
    ADD CONSTRAINT [CK_SalesOrderHeader_TaxAmt] CHECK ([TaxAmt]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [TaxAmt] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'CONSTRAINT', @level2name = N'CK_SalesOrderHeader_TaxAmt';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesOrderHeader_rowguid]
    ON [Sales].[SalesOrderHeader]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'INDEX', @level2name = N'AK_SalesOrderHeader_rowguid';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesOrderHeader_SalesOrderNumber]
    ON [Sales].[SalesOrderHeader]([SalesOrderNumber] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'INDEX', @level2name = N'AK_SalesOrderHeader_SalesOrderNumber';


GO





CREATE NONCLUSTERED INDEX [IX_SalesOrderHeader_CustomerID]
    ON [Sales].[SalesOrderHeader]([CustomerID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'INDEX', @level2name = N'IX_SalesOrderHeader_CustomerID';


GO





CREATE NONCLUSTERED INDEX [IX_SalesOrderHeader_SalesPersonID]
    ON [Sales].[SalesOrderHeader]([SalesPersonID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'INDEX', @level2name = N'IX_SalesOrderHeader_SalesPersonID';


GO






CREATE TRIGGER [Sales].[uSalesOrderHeader] ON [Sales].[SalesOrderHeader] 
AFTER UPDATE NOT FOR REPLICATION AS 
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0 
        RETURN;

    SET NOCOUNT ON;

    BEGIN TRY
        -- Update RevisionNumber for modification of any field EXCEPT the Status.
        IF NOT UPDATE([Status])
        BEGIN
            UPDATE [Sales].[SalesOrderHeader]
            SET [Sales].[SalesOrderHeader].[RevisionNumber] = 
                [Sales].[SalesOrderHeader].[RevisionNumber] + 1
            WHERE [Sales].[SalesOrderHeader].[SalesOrderID] IN 
                (SELECT inserted.[SalesOrderID] FROM inserted);
        END;

        -- Update the SalesPerson SalesYTD when SubTotal is updated
        IF UPDATE([SubTotal])
        BEGIN
            DECLARE @StartDate datetime,
                    @EndDate datetime

            SET @StartDate = [dbo].[ufnGetAccountingStartDate]();
            SET @EndDate = [dbo].[ufnGetAccountingEndDate]();

            UPDATE [Sales].[SalesPerson]
            SET [Sales].[SalesPerson].[SalesYTD] = 
                (SELECT SUM([Sales].[SalesOrderHeader].[SubTotal])
                FROM [Sales].[SalesOrderHeader] 
                WHERE [Sales].[SalesPerson].[BusinessEntityID] = [Sales].[SalesOrderHeader].[SalesPersonID]
                    AND ([Sales].[SalesOrderHeader].[Status] = 5) -- Shipped
                    AND [Sales].[SalesOrderHeader].[OrderDate] BETWEEN @StartDate AND @EndDate)
            WHERE [Sales].[SalesPerson].[BusinessEntityID] 
                IN (SELECT DISTINCT inserted.[SalesPersonID] FROM inserted 
                    WHERE inserted.[OrderDate] BETWEEN @StartDate AND @EndDate);

            -- Update the SalesTerritory SalesYTD when SubTotal is updated
            UPDATE [Sales].[SalesTerritory]
            SET [Sales].[SalesTerritory].[SalesYTD] = 
                (SELECT SUM([Sales].[SalesOrderHeader].[SubTotal])
                FROM [Sales].[SalesOrderHeader] 
                WHERE [Sales].[SalesTerritory].[TerritoryID] = [Sales].[SalesOrderHeader].[TerritoryID]
                    AND ([Sales].[SalesOrderHeader].[Status] = 5) -- Shipped
                    AND [Sales].[SalesOrderHeader].[OrderDate] BETWEEN @StartDate AND @EndDate)
            WHERE [Sales].[SalesTerritory].[TerritoryID] 
                IN (SELECT DISTINCT inserted.[TerritoryID] FROM inserted 
                    WHERE inserted.[OrderDate] BETWEEN @StartDate AND @EndDate);
        END;
    END TRY
    BEGIN CATCH
        EXECUTE [dbo].[uspPrintError];

        -- Rollback any active or uncommittable transactions before
        -- inserting information in the ErrorLog
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'AFTER UPDATE trigger that updates the RevisionNumber and ModifiedDate columns in the SalesOrderHeader table.Updates the SalesYTD column in the SalesPerson and SalesTerritory tables.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader', @level2type = N'TRIGGER', @level2name = N'uSalesOrderHeader';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'General sales order information.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'SalesOrderHeader';


GO






CREATE VIEW [Sales].[vIndividualCustomer] 
AS 
SELECT 
    p.[BusinessEntityID]
    ,p.[Title]
    ,p.[FirstName]
    ,p.[MiddleName]
    ,p.[LastName]
    ,p.[Suffix]
    ,pp.[PhoneNumber]
	,pnt.[Name] AS [PhoneNumberType]
    ,ea.[EmailAddress]
    ,p.[EmailPromotion]
    ,at.[Name] AS [AddressType]
    ,a.[AddressLine1]
    ,a.[AddressLine2]
    ,a.[City]
    ,[StateProvinceName] = sp.[Name]
    ,a.[PostalCode]
    ,[CountryRegionName] = cr.[Name]
    ,p.[Demographics]
FROM [Person].[Person] p
    INNER JOIN [Person].[BusinessEntityAddress] bea 
    ON bea.[BusinessEntityID] = p.[BusinessEntityID] 
    INNER JOIN [Person].[Address] a 
    ON a.[AddressID] = bea.[AddressID]
    INNER JOIN [Person].[StateProvince] sp 
    ON sp.[StateProvinceID] = a.[StateProvinceID]
    INNER JOIN [Person].[CountryRegion] cr 
    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]
    INNER JOIN [Person].[AddressType] at 
    ON at.[AddressTypeID] = bea.[AddressTypeID]
	INNER JOIN [Sales].[Customer] c
	ON c.[PersonID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[EmailAddress] ea
	ON ea.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PersonPhone] pp
	ON pp.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PhoneNumberType] pnt
	ON pnt.[PhoneNumberTypeID] = pp.[PhoneNumberTypeID]
WHERE c.StoreID IS NULL;
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Individual customers (names and addresses) that purchase Adventure Works Cycles products online.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'VIEW', @level1name = N'vIndividualCustomer';


GO






CREATE VIEW [Sales].[vPersonDemographics] 
AS 
SELECT 
    p.[BusinessEntityID] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        TotalPurchaseYTD[1]', 'money') AS [TotalPurchaseYTD] 
    ,CONVERT(datetime, REPLACE([IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        DateFirstPurchase[1]', 'nvarchar(20)') ,'Z', ''), 101) AS [DateFirstPurchase] 
    ,CONVERT(datetime, REPLACE([IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        BirthDate[1]', 'nvarchar(20)') ,'Z', ''), 101) AS [BirthDate] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        MaritalStatus[1]', 'nvarchar(1)') AS [MaritalStatus] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        YearlyIncome[1]', 'nvarchar(30)') AS [YearlyIncome] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        Gender[1]', 'nvarchar(1)') AS [Gender] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        TotalChildren[1]', 'integer') AS [TotalChildren] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        NumberChildrenAtHome[1]', 'integer') AS [NumberChildrenAtHome] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        Education[1]', 'nvarchar(30)') AS [Education] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        Occupation[1]', 'nvarchar(30)') AS [Occupation] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        HomeOwnerFlag[1]', 'bit') AS [HomeOwnerFlag] 
    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
        NumberCarsOwned[1]', 'integer') AS [NumberCarsOwned] 
FROM [Person].[Person] p 
CROSS APPLY p.[Demographics].nodes(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 
    /IndividualSurvey') AS [IndividualSurvey](ref) 
WHERE [Demographics] IS NOT NULL;
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Displays the content from each element in the xml column Demographics for each customer in the Person.Person table.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'VIEW', @level1name = N'vPersonDemographics';


GO






CREATE VIEW [Sales].[vSalesPerson] 
AS 
SELECT 
    s.[BusinessEntityID]
    ,p.[Title]
    ,p.[FirstName]
    ,p.[MiddleName]
    ,p.[LastName]
    ,p.[Suffix]
    ,e.[JobTitle]
    ,pp.[PhoneNumber]
	,pnt.[Name] AS [PhoneNumberType]
    ,ea.[EmailAddress]
    ,p.[EmailPromotion]
    ,a.[AddressLine1]
    ,a.[AddressLine2]
    ,a.[City]
    ,[StateProvinceName] = sp.[Name]
    ,a.[PostalCode]
    ,[CountryRegionName] = cr.[Name]
    ,[TerritoryName] = st.[Name]
    ,[TerritoryGroup] = st.[Group]
    ,s.[SalesQuota]
    ,s.[SalesYTD]
    ,s.[SalesLastYear]
FROM [Sales].[SalesPerson] s
    INNER JOIN [HumanResources].[Employee] e 
    ON e.[BusinessEntityID] = s.[BusinessEntityID]
	INNER JOIN [Person].[Person] p
	ON p.[BusinessEntityID] = s.[BusinessEntityID]
    INNER JOIN [Person].[BusinessEntityAddress] bea 
    ON bea.[BusinessEntityID] = s.[BusinessEntityID] 
    INNER JOIN [Person].[Address] a 
    ON a.[AddressID] = bea.[AddressID]
    INNER JOIN [Person].[StateProvince] sp 
    ON sp.[StateProvinceID] = a.[StateProvinceID]
    INNER JOIN [Person].[CountryRegion] cr 
    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]
    LEFT OUTER JOIN [Sales].[SalesTerritory] st 
    ON st.[TerritoryID] = s.[TerritoryID]
	LEFT OUTER JOIN [Person].[EmailAddress] ea
	ON ea.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PersonPhone] pp
	ON pp.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PhoneNumberType] pnt
	ON pnt.[PhoneNumberTypeID] = pp.[PhoneNumberTypeID];
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sales representiatives (names and addresses) and their sales-related information.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'VIEW', @level1name = N'vSalesPerson';


GO






CREATE VIEW [Sales].[vSalesPersonSalesByFiscalYears] 
AS 
SELECT 
    pvt.[SalesPersonID]
    ,pvt.[FullName]
    ,pvt.[JobTitle]
    ,pvt.[SalesTerritory]
    ,pvt.[2002]
    ,pvt.[2003]
    ,pvt.[2004] 
FROM (SELECT 
        soh.[SalesPersonID]
        ,p.[FirstName] + ' ' + COALESCE(p.[MiddleName], '') + ' ' + p.[LastName] AS [FullName]
        ,e.[JobTitle]
        ,st.[Name] AS [SalesTerritory]
        ,soh.[SubTotal]
        ,YEAR(DATEADD(m, 6, soh.[OrderDate])) AS [FiscalYear] 
    FROM [Sales].[SalesPerson] sp 
        INNER JOIN [Sales].[SalesOrderHeader] soh 
        ON sp.[BusinessEntityID] = soh.[SalesPersonID]
        INNER JOIN [Sales].[SalesTerritory] st 
        ON sp.[TerritoryID] = st.[TerritoryID] 
        INNER JOIN [HumanResources].[Employee] e 
        ON soh.[SalesPersonID] = e.[BusinessEntityID] 
		INNER JOIN [Person].[Person] p
		ON p.[BusinessEntityID] = sp.[BusinessEntityID]
	 ) AS soh 
PIVOT 
(
    SUM([SubTotal]) 
    FOR [FiscalYear] 
    IN ([2002], [2003], [2004])
) AS pvt;
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Uses PIVOT to return aggregated sales information for each sales representative.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'VIEW', @level1name = N'vSalesPersonSalesByFiscalYears';


GO






CREATE VIEW [Sales].[vStoreWithDemographics] AS 
SELECT 
    s.[BusinessEntityID] 
    ,s.[Name] 
    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 
        (/StoreSurvey/AnnualSales)[1]', 'money') AS [AnnualSales] 
    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 
        (/StoreSurvey/AnnualRevenue)[1]', 'money') AS [AnnualRevenue] 
    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 
        (/StoreSurvey/BankName)[1]', 'nvarchar(50)') AS [BankName] 
    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 
        (/StoreSurvey/BusinessType)[1]', 'nvarchar(5)') AS [BusinessType] 
    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 
        (/StoreSurvey/YearOpened)[1]', 'integer') AS [YearOpened] 
    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 
        (/StoreSurvey/Specialty)[1]', 'nvarchar(50)') AS [Specialty] 
    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 
        (/StoreSurvey/SquareFeet)[1]', 'integer') AS [SquareFeet] 
    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 
        (/StoreSurvey/Brands)[1]', 'nvarchar(30)') AS [Brands] 
    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 
        (/StoreSurvey/Internet)[1]', 'nvarchar(30)') AS [Internet] 
    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 
        (/StoreSurvey/NumberEmployees)[1]', 'integer') AS [NumberEmployees] 
FROM [Sales].[Store] s;
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores (including demographics) that sell Adventure Works Cycles products to consumers.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'VIEW', @level1name = N'vStoreWithDemographics';


GO






CREATE VIEW [Sales].[vStoreWithContacts] AS 
SELECT 
    s.[BusinessEntityID] 
    ,s.[Name] 
    ,ct.[Name] AS [ContactType] 
    ,p.[Title] 
    ,p.[FirstName] 
    ,p.[MiddleName] 
    ,p.[LastName] 
    ,p.[Suffix] 
    ,pp.[PhoneNumber] 
	,pnt.[Name] AS [PhoneNumberType]
    ,ea.[EmailAddress] 
    ,p.[EmailPromotion] 
FROM [Sales].[Store] s
    INNER JOIN [Person].[BusinessEntityContact] bec 
    ON bec.[BusinessEntityID] = s.[BusinessEntityID]
	INNER JOIN [Person].[ContactType] ct
	ON ct.[ContactTypeID] = bec.[ContactTypeID]
	INNER JOIN [Person].[Person] p
	ON p.[BusinessEntityID] = bec.[PersonID]
	LEFT OUTER JOIN [Person].[EmailAddress] ea
	ON ea.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PersonPhone] pp
	ON pp.[BusinessEntityID] = p.[BusinessEntityID]
	LEFT OUTER JOIN [Person].[PhoneNumberType] pnt
	ON pnt.[PhoneNumberTypeID] = pp.[PhoneNumberTypeID];
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores (including store contacts) that sell Adventure Works Cycles products to consumers.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'VIEW', @level1name = N'vStoreWithContacts';


GO






CREATE VIEW [Sales].[vStoreWithAddresses] AS 
SELECT 
    s.[BusinessEntityID] 
    ,s.[Name] 
    ,at.[Name] AS [AddressType]
    ,a.[AddressLine1] 
    ,a.[AddressLine2] 
    ,a.[City] 
    ,sp.[Name] AS [StateProvinceName] 
    ,a.[PostalCode] 
    ,cr.[Name] AS [CountryRegionName] 
FROM [Sales].[Store] s
    INNER JOIN [Person].[BusinessEntityAddress] bea 
    ON bea.[BusinessEntityID] = s.[BusinessEntityID] 
    INNER JOIN [Person].[Address] a 
    ON a.[AddressID] = bea.[AddressID]
    INNER JOIN [Person].[StateProvince] sp 
    ON sp.[StateProvinceID] = a.[StateProvinceID]
    INNER JOIN [Person].[CountryRegion] cr 
    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]
    INNER JOIN [Person].[AddressType] at 
    ON at.[AddressTypeID] = bea.[AddressTypeID];
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Stores (including store addresses) that sell Adventure Works Cycles products to consumers.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'VIEW', @level1name = N'vStoreWithAddresses';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains objects related to customers, sales orders, and sales territories.', @level0type = N'SCHEMA', @level0name = N'Sales';


GO



