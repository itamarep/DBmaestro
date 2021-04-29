CREATE SCHEMA [Production]
    AUTHORIZATION [dbo];


GO

CREATE XML SCHEMA COLLECTION [Production].[ManuInstructionsSchemaCollection]
    AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions" elementFormDefault="qualified">
  <xsd:element name="root">
    <xsd:complexType mixed="true">
      <xsd:complexContent mixed="true">
        <xsd:restriction base="xsd:anyType">
          <xsd:sequence>
            <xsd:element name="Location" maxOccurs="unbounded">
              <xsd:complexType mixed="true">
                <xsd:complexContent mixed="true">
                  <xsd:restriction base="xsd:anyType">
                    <xsd:sequence>
                      <xsd:element name="step" type="t:StepType" maxOccurs="unbounded" />
                    </xsd:sequence>
                    <xsd:attribute name="LocationID" type="xsd:integer" use="required" />
                    <xsd:attribute name="SetupHours" type="xsd:decimal" />
                    <xsd:attribute name="MachineHours" type="xsd:decimal" />
                    <xsd:attribute name="LaborHours" type="xsd:decimal" />
                    <xsd:attribute name="LotSize" type="xsd:decimal" />
                  </xsd:restriction>
                </xsd:complexContent>
              </xsd:complexType>
            </xsd:element>
          </xsd:sequence>
        </xsd:restriction>
      </xsd:complexContent>
    </xsd:complexType>
  </xsd:element>
  <xsd:complexType name="StepType" mixed="true">
    <xsd:complexContent mixed="true">
      <xsd:restriction base="xsd:anyType">
        <xsd:choice minOccurs="0" maxOccurs="unbounded">
          <xsd:element name="tool" type="xsd:string" />
          <xsd:element name="material" type="xsd:string" />
          <xsd:element name="blueprint" type="xsd:string" />
          <xsd:element name="specs" type="xsd:string" />
          <xsd:element name="diag" type="xsd:string" />
        </xsd:choice>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
</xsd:schema>';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Collection of XML schemas for the Instructions column in the Production.ProductModel table.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'XML SCHEMA COLLECTION', @level1name = N'ManuInstructionsSchemaCollection';


GO





CREATE XML SCHEMA COLLECTION [Production].[ProductDescriptionSchemaCollection]
    AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain" elementFormDefault="qualified">
  <xsd:element name="Maintenance">
    <xsd:complexType>
      <xsd:complexContent>
        <xsd:restriction base="xsd:anyType">
          <xsd:sequence>
            <xsd:element name="NoOfYears" type="xsd:string" />
            <xsd:element name="Description" type="xsd:string" />
          </xsd:sequence>
        </xsd:restriction>
      </xsd:complexContent>
    </xsd:complexType>
  </xsd:element>
  <xsd:element name="Warranty">
    <xsd:complexType>
      <xsd:complexContent>
        <xsd:restriction base="xsd:anyType">
          <xsd:sequence>
            <xsd:element name="WarrantyPeriod" type="xsd:string" />
            <xsd:element name="Description" type="xsd:string" />
          </xsd:sequence>
        </xsd:restriction>
      </xsd:complexContent>
    </xsd:complexType>
  </xsd:element>
</xsd:schema>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription" elementFormDefault="qualified">
  <xsd:import namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain" />
  <xsd:element name="Code" type="xsd:string" />
  <xsd:element name="Description" type="xsd:string" />
  <xsd:element name="ProductDescription" type="t:ProductDescription" />
  <xsd:element name="Taxonomy" type="xsd:string" />
  <xsd:complexType name="Category">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element ref="t:Taxonomy" />
          <xsd:element ref="t:Code" />
          <xsd:element ref="t:Description" minOccurs="0" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="Features" mixed="true">
    <xsd:complexContent mixed="true">
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element ref="ns1:Warranty" />
          <xsd:element ref="ns1:Maintenance" />
          <xsd:any namespace="##other" processContents="skip" minOccurs="0" maxOccurs="unbounded" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="Manufacturer">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Name" type="xsd:string" minOccurs="0" />
          <xsd:element name="CopyrightURL" type="xsd:string" minOccurs="0" />
          <xsd:element name="Copyright" type="xsd:string" minOccurs="0" />
          <xsd:element name="ProductURL" type="xsd:string" minOccurs="0" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="Picture">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Name" type="xsd:string" minOccurs="0" />
          <xsd:element name="Angle" type="xsd:string" minOccurs="0" />
          <xsd:element name="Size" type="xsd:string" minOccurs="0" />
          <xsd:element name="ProductPhotoID" type="xsd:integer" minOccurs="0" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="ProductDescription">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Summary" type="t:Summary" minOccurs="0" />
          <xsd:element name="Manufacturer" type="t:Manufacturer" minOccurs="0" />
          <xsd:element name="Features" type="t:Features" minOccurs="0" maxOccurs="unbounded" />
          <xsd:element name="Picture" type="t:Picture" minOccurs="0" maxOccurs="unbounded" />
          <xsd:element name="Category" type="t:Category" minOccurs="0" maxOccurs="unbounded" />
          <xsd:element name="Specifications" type="t:Specifications" minOccurs="0" maxOccurs="unbounded" />
        </xsd:sequence>
        <xsd:attribute name="ProductModelID" type="xsd:string" />
        <xsd:attribute name="ProductModelName" type="xsd:string" />
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="Specifications" mixed="true">
    <xsd:complexContent mixed="true">
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:any processContents="skip" minOccurs="0" maxOccurs="unbounded" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="Summary" mixed="true">
    <xsd:complexContent mixed="true">
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:any namespace="http://www.w3.org/1999/xhtml" processContents="skip" minOccurs="0" maxOccurs="unbounded" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
</xsd:schema>';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Collection of XML schemas for the CatalogDescription column in the Production.ProductModel table.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'XML SCHEMA COLLECTION', @level1name = N'ProductDescriptionSchemaCollection';


GO





CREATE TABLE [Production].[Illustration] (
    [IllustrationID] INT      IDENTITY (1, 1) NOT NULL,
    [Diagram]        XML      NULL,
    [ModifiedDate]   DATETIME NOT NULL
);


GO

ALTER TABLE [Production].[Illustration]
    ADD CONSTRAINT [PK_Illustration_IllustrationID] PRIMARY KEY CLUSTERED ([IllustrationID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Illustration', @level2type = N'CONSTRAINT', @level2name = N'PK_Illustration_IllustrationID';


GO





ALTER TABLE [Production].[Illustration]
    ADD CONSTRAINT [DF_Illustration_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Illustration', @level2type = N'CONSTRAINT', @level2name = N'DF_Illustration_ModifiedDate';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Bicycle assembly diagrams.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Illustration';


GO





CREATE TABLE [Production].[Location] (
    [LocationID]   SMALLINT       IDENTITY (1, 1) NOT NULL,
    [Name]         [dbo].[Name]   NOT NULL,
    [CostRate]     SMALLMONEY     NOT NULL,
    [Availability] DECIMAL (8, 2) NOT NULL,
    [ModifiedDate] DATETIME       NOT NULL
);


GO

ALTER TABLE [Production].[Location]
    ADD CONSTRAINT [PK_Location_LocationID] PRIMARY KEY CLUSTERED ([LocationID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Location', @level2type = N'CONSTRAINT', @level2name = N'PK_Location_LocationID';


GO





ALTER TABLE [Production].[Location]
    ADD CONSTRAINT [DF_Location_Availability] DEFAULT ((0.00)) FOR [Availability];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.00', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Location', @level2type = N'CONSTRAINT', @level2name = N'DF_Location_Availability';


GO





ALTER TABLE [Production].[Location]
    ADD CONSTRAINT [DF_Location_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Location', @level2type = N'CONSTRAINT', @level2name = N'DF_Location_ModifiedDate';


GO





ALTER TABLE [Production].[Location]
    ADD CONSTRAINT [DF_Location_CostRate] DEFAULT ((0.00)) FOR [CostRate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0.0', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Location', @level2type = N'CONSTRAINT', @level2name = N'DF_Location_CostRate';


GO





ALTER TABLE [Production].[Location]
    ADD CONSTRAINT [CK_Location_Availability] CHECK ([Availability]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [Availability] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Location', @level2type = N'CONSTRAINT', @level2name = N'CK_Location_Availability';


GO





ALTER TABLE [Production].[Location]
    ADD CONSTRAINT [CK_Location_CostRate] CHECK ([CostRate]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [CostRate] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Location', @level2type = N'CONSTRAINT', @level2name = N'CK_Location_CostRate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Location_Name]
    ON [Production].[Location]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Location', @level2type = N'INDEX', @level2name = N'AK_Location_Name';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Product inventory and manufacturing locations.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Location';


GO





CREATE TABLE [Production].[Product] (
    [ProductID]             INT              IDENTITY (1, 1) NOT NULL,
    [Name]                  [dbo].[Name]     NOT NULL,
    [ProductNumber]         NVARCHAR (25)    NOT NULL,
    [MakeFlag]              [dbo].[Flag]     NOT NULL,
    [FinishedGoodsFlag]     [dbo].[Flag]     NOT NULL,
    [Color]                 NVARCHAR (15)    NULL,
    [SafetyStockLevel]      SMALLINT         NOT NULL,
    [ReorderPoint]          SMALLINT         NOT NULL,
    [StandardCost]          MONEY            NOT NULL,
    [ListPrice]             MONEY            NOT NULL,
    [Size]                  NVARCHAR (5)     NULL,
    [SizeUnitMeasureCode]   NCHAR (3)        NULL,
    [WeightUnitMeasureCode] NCHAR (3)        NULL,
    [Weight]                DECIMAL (8, 2)   NULL,
    [DaysToManufacture]     INT              NOT NULL,
    [ProductLine]           NCHAR (2)        NULL,
    [Class]                 NCHAR (2)        NULL,
    [Style]                 NCHAR (2)        NULL,
    [ProductSubcategoryID]  INT              NULL,
    [ProductModelID]        INT              NULL,
    [SellStartDate]         DATETIME         NOT NULL,
    [SellEndDate]           DATETIME         NULL,
    [DiscontinuedDate]      DATETIME         NULL,
    [rowguid]               UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]          DATETIME         NOT NULL
);


GO

ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [PK_Product_ProductID] PRIMARY KEY CLUSTERED ([ProductID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'PK_Product_ProductID';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [FK_Product_UnitMeasure_SizeUnitMeasureCode] FOREIGN KEY ([SizeUnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing UnitMeasure.UnitMeasureCode.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'FK_Product_UnitMeasure_SizeUnitMeasureCode';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [FK_Product_UnitMeasure_WeightUnitMeasureCode] FOREIGN KEY ([WeightUnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing UnitMeasure.UnitMeasureCode.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'FK_Product_UnitMeasure_WeightUnitMeasureCode';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [FK_Product_ProductModel_ProductModelID] FOREIGN KEY ([ProductModelID]) REFERENCES [Production].[ProductModel] ([ProductModelID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing ProductModel.ProductModelID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'FK_Product_ProductModel_ProductModelID';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [FK_Product_ProductSubcategory_ProductSubcategoryID] FOREIGN KEY ([ProductSubcategoryID]) REFERENCES [Production].[ProductSubcategory] ([ProductSubcategoryID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing ProductSubcategory.ProductSubcategoryID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'FK_Product_ProductSubcategory_ProductSubcategoryID';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [DF_Product_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'DF_Product_rowguid';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [DF_Product_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'DF_Product_ModifiedDate';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [DF_Product_FinishedGoodsFlag] DEFAULT ((1)) FOR [FinishedGoodsFlag];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of  1', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'DF_Product_FinishedGoodsFlag';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [DF_Product_MakeFlag] DEFAULT ((1)) FOR [MakeFlag];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of  1', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'DF_Product_MakeFlag';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [CK_Product_ReorderPoint] CHECK ([ReorderPoint]>(0));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [ReorderPoint] > (0)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'CK_Product_ReorderPoint';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [CK_Product_StandardCost] CHECK ([StandardCost]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [SafetyStockLevel] > (0)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'CK_Product_StandardCost';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [CK_Product_ListPrice] CHECK ([ListPrice]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [ListPrice] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'CK_Product_ListPrice';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [CK_Product_Weight] CHECK ([Weight]>(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [Weight] > (0.00)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'CK_Product_Weight';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [CK_Product_DaysToManufacture] CHECK ([DaysToManufacture]>=(0));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [DaysToManufacture] >= (0)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'CK_Product_DaysToManufacture';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [CK_Product_SafetyStockLevel] CHECK ([SafetyStockLevel]>(0));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [SafetyStockLevel] > (0)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'CK_Product_SafetyStockLevel';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [CK_Product_ProductLine] CHECK (upper([ProductLine])='R' OR upper([ProductLine])='M' OR upper([ProductLine])='T' OR upper([ProductLine])='S' OR [ProductLine] IS NULL);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [ProductLine]=''r'' OR [ProductLine]=''m'' OR [ProductLine]=''t'' OR [ProductLine]=''s'' OR [ProductLine]=''R'' OR [ProductLine]=''M'' OR [ProductLine]=''T'' OR [ProductLine]=''S'' OR [ProductLine] IS NULL', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'CK_Product_ProductLine';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [CK_Product_Class] CHECK (upper([Class])='H' OR upper([Class])='M' OR upper([Class])='L' OR [Class] IS NULL);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [Class]=''h'' OR [Class]=''m'' OR [Class]=''l'' OR [Class]=''H'' OR [Class]=''M'' OR [Class]=''L'' OR [Class] IS NULL', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'CK_Product_Class';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [CK_Product_Style] CHECK (upper([Style])='U' OR upper([Style])='M' OR upper([Style])='W' OR [Style] IS NULL);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [Style]=''u'' OR [Style]=''m'' OR [Style]=''w'' OR [Style]=''U'' OR [Style]=''M'' OR [Style]=''W'' OR [Style] IS NULL', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'CK_Product_Style';


GO





ALTER TABLE [Production].[Product]
    ADD CONSTRAINT [CK_Product_SellEndDate] CHECK ([SellEndDate]>=[SellStartDate] OR [SellEndDate] IS NULL);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [SellEndDate] >= [SellStartDate] OR [SellEndDate] IS NULL', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'CONSTRAINT', @level2name = N'CK_Product_SellEndDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Product_ProductNumber]
    ON [Production].[Product]([ProductNumber] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'INDEX', @level2name = N'AK_Product_ProductNumber';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Product_Name]
    ON [Production].[Product]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'INDEX', @level2name = N'AK_Product_Name';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Product_rowguid]
    ON [Production].[Product]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product', @level2type = N'INDEX', @level2name = N'AK_Product_rowguid';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Products sold or used in the manfacturing of sold products.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Product';


GO





CREATE TABLE [Production].[ScrapReason] (
    [ScrapReasonID] SMALLINT     IDENTITY (1, 1) NOT NULL,
    [Name]          [dbo].[Name] NOT NULL,
    [ModifiedDate]  DATETIME     NOT NULL
);


GO

ALTER TABLE [Production].[ScrapReason]
    ADD CONSTRAINT [PK_ScrapReason_ScrapReasonID] PRIMARY KEY CLUSTERED ([ScrapReasonID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ScrapReason', @level2type = N'CONSTRAINT', @level2name = N'PK_ScrapReason_ScrapReasonID';


GO





ALTER TABLE [Production].[ScrapReason]
    ADD CONSTRAINT [DF_ScrapReason_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ScrapReason', @level2type = N'CONSTRAINT', @level2name = N'DF_ScrapReason_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_ScrapReason_Name]
    ON [Production].[ScrapReason]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ScrapReason', @level2type = N'INDEX', @level2name = N'AK_ScrapReason_Name';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Manufacturing failure reasons lookup table.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ScrapReason';


GO





CREATE TABLE [Production].[ProductCategory] (
    [ProductCategoryID] INT              IDENTITY (1, 1) NOT NULL,
    [Name]              [dbo].[Name]     NOT NULL,
    [rowguid]           UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]      DATETIME         NOT NULL
);


GO

ALTER TABLE [Production].[ProductCategory]
    ADD CONSTRAINT [PK_ProductCategory_ProductCategoryID] PRIMARY KEY CLUSTERED ([ProductCategoryID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCategory', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductCategory_ProductCategoryID';


GO





ALTER TABLE [Production].[ProductCategory]
    ADD CONSTRAINT [DF_ProductCategory_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCategory', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductCategory_rowguid';


GO





ALTER TABLE [Production].[ProductCategory]
    ADD CONSTRAINT [DF_ProductCategory_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCategory', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductCategory_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductCategory_Name]
    ON [Production].[ProductCategory]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCategory', @level2type = N'INDEX', @level2name = N'AK_ProductCategory_Name';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductCategory_rowguid]
    ON [Production].[ProductCategory]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCategory', @level2type = N'INDEX', @level2name = N'AK_ProductCategory_rowguid';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'High-level product categorization.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCategory';


GO





CREATE TABLE [Production].[ProductCostHistory] (
    [ProductID]    INT      NOT NULL,
    [StartDate]    DATETIME NOT NULL,
    [EndDate]      DATETIME NULL,
    [StandardCost] MONEY    NOT NULL,
    [ModifiedDate] DATETIME NOT NULL
);


GO

ALTER TABLE [Production].[ProductCostHistory]
    ADD CONSTRAINT [PK_ProductCostHistory_ProductID_StartDate] PRIMARY KEY CLUSTERED ([ProductID] ASC, [StartDate] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCostHistory', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductCostHistory_ProductID_StartDate';


GO





ALTER TABLE [Production].[ProductCostHistory]
    ADD CONSTRAINT [FK_ProductCostHistory_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Product.ProductID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCostHistory', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductCostHistory_Product_ProductID';


GO





ALTER TABLE [Production].[ProductCostHistory]
    ADD CONSTRAINT [DF_ProductCostHistory_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCostHistory', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductCostHistory_ModifiedDate';


GO





ALTER TABLE [Production].[ProductCostHistory]
    ADD CONSTRAINT [CK_ProductCostHistory_StandardCost] CHECK ([StandardCost]>=(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [StandardCost] >= (0.00)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCostHistory', @level2type = N'CONSTRAINT', @level2name = N'CK_ProductCostHistory_StandardCost';


GO





ALTER TABLE [Production].[ProductCostHistory]
    ADD CONSTRAINT [CK_ProductCostHistory_EndDate] CHECK ([EndDate]>=[StartDate] OR [EndDate] IS NULL);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NULL', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCostHistory', @level2type = N'CONSTRAINT', @level2name = N'CK_ProductCostHistory_EndDate';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Changes in the cost of a product over time.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductCostHistory';


GO





CREATE TABLE [Production].[ProductDescription] (
    [ProductDescriptionID] INT              IDENTITY (1, 1) NOT NULL,
    [Description]          NVARCHAR (400)   NOT NULL,
    [rowguid]              UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]         DATETIME         NOT NULL
);


GO

ALTER TABLE [Production].[ProductDescription]
    ADD CONSTRAINT [PK_ProductDescription_ProductDescriptionID] PRIMARY KEY CLUSTERED ([ProductDescriptionID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductDescription', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductDescription_ProductDescriptionID';


GO





ALTER TABLE [Production].[ProductDescription]
    ADD CONSTRAINT [DF_ProductDescription_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductDescription', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductDescription_rowguid';


GO





ALTER TABLE [Production].[ProductDescription]
    ADD CONSTRAINT [DF_ProductDescription_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductDescription', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductDescription_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductDescription_rowguid]
    ON [Production].[ProductDescription]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductDescription', @level2type = N'INDEX', @level2name = N'AK_ProductDescription_rowguid';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Product descriptions in several languages.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductDescription';


GO





CREATE TABLE [Production].[ProductDocument] (
    [ProductID]    INT                 NOT NULL,
    [DocumentNode] [sys].[hierarchyid] NOT NULL,
    [ModifiedDate] DATETIME            NOT NULL
);


GO

ALTER TABLE [Production].[ProductDocument]
    ADD CONSTRAINT [PK_ProductDocument_ProductID_DocumentNode] PRIMARY KEY CLUSTERED ([ProductID] ASC, [DocumentNode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductDocument', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductDocument_ProductID_DocumentNode';


GO





ALTER TABLE [Production].[ProductDocument]
    ADD CONSTRAINT [FK_ProductDocument_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Product.ProductID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductDocument', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductDocument_Product_ProductID';


GO





ALTER TABLE [Production].[ProductDocument]
    ADD CONSTRAINT [FK_ProductDocument_Document_DocumentNode] FOREIGN KEY ([DocumentNode]) REFERENCES [Production].[Document] ([DocumentNode]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Document.DocumentNode.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductDocument', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductDocument_Document_DocumentNode';


GO





ALTER TABLE [Production].[ProductDocument]
    ADD CONSTRAINT [DF_ProductDocument_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductDocument', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductDocument_ModifiedDate';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-reference table mapping products to related product documents.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductDocument';


GO





CREATE TABLE [Production].[ProductInventory] (
    [ProductID]    INT              NOT NULL,
    [LocationID]   SMALLINT         NOT NULL,
    [Shelf]        NVARCHAR (10)    NOT NULL,
    [Bin]          TINYINT          NOT NULL,
    [Quantity]     SMALLINT         NOT NULL,
    [rowguid]      UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate] DATETIME         NOT NULL
);


GO

ALTER TABLE [Production].[ProductInventory]
    ADD CONSTRAINT [PK_ProductInventory_ProductID_LocationID] PRIMARY KEY CLUSTERED ([ProductID] ASC, [LocationID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductInventory', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductInventory_ProductID_LocationID';


GO





ALTER TABLE [Production].[ProductInventory]
    ADD CONSTRAINT [FK_ProductInventory_Location_LocationID] FOREIGN KEY ([LocationID]) REFERENCES [Production].[Location] ([LocationID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Location.LocationID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductInventory', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductInventory_Location_LocationID';


GO





ALTER TABLE [Production].[ProductInventory]
    ADD CONSTRAINT [FK_ProductInventory_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Product.ProductID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductInventory', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductInventory_Product_ProductID';


GO





ALTER TABLE [Production].[ProductInventory]
    ADD CONSTRAINT [DF_ProductInventory_Quantity] DEFAULT ((0)) FOR [Quantity];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductInventory', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductInventory_Quantity';


GO





ALTER TABLE [Production].[ProductInventory]
    ADD CONSTRAINT [DF_ProductInventory_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductInventory', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductInventory_ModifiedDate';


GO





ALTER TABLE [Production].[ProductInventory]
    ADD CONSTRAINT [DF_ProductInventory_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductInventory', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductInventory_rowguid';


GO





ALTER TABLE [Production].[ProductInventory]
    ADD CONSTRAINT [CK_ProductInventory_Shelf] CHECK ([Shelf] like '[A-Za-z]' OR [Shelf]='N/A');


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [Shelf] like ''[A-Za-z]'' OR [Shelf]=''N/A''', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductInventory', @level2type = N'CONSTRAINT', @level2name = N'CK_ProductInventory_Shelf';


GO





ALTER TABLE [Production].[ProductInventory]
    ADD CONSTRAINT [CK_ProductInventory_Bin] CHECK ([Bin]>=(0) AND [Bin]<=(100));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [Bin] BETWEEN (0) AND (100)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductInventory', @level2type = N'CONSTRAINT', @level2name = N'CK_ProductInventory_Bin';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Product inventory information.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductInventory';


GO





CREATE TABLE [Production].[ProductListPriceHistory] (
    [ProductID]    INT      NOT NULL,
    [StartDate]    DATETIME NOT NULL,
    [EndDate]      DATETIME NULL,
    [ListPrice]    MONEY    NOT NULL,
    [ModifiedDate] DATETIME NOT NULL
);


GO

ALTER TABLE [Production].[ProductListPriceHistory]
    ADD CONSTRAINT [PK_ProductListPriceHistory_ProductID_StartDate] PRIMARY KEY CLUSTERED ([ProductID] ASC, [StartDate] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductListPriceHistory', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductListPriceHistory_ProductID_StartDate';


GO





ALTER TABLE [Production].[ProductListPriceHistory]
    ADD CONSTRAINT [FK_ProductListPriceHistory_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Product.ProductID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductListPriceHistory', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductListPriceHistory_Product_ProductID';


GO





ALTER TABLE [Production].[ProductListPriceHistory]
    ADD CONSTRAINT [DF_ProductListPriceHistory_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductListPriceHistory', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductListPriceHistory_ModifiedDate';


GO





ALTER TABLE [Production].[ProductListPriceHistory]
    ADD CONSTRAINT [CK_ProductListPriceHistory_ListPrice] CHECK ([ListPrice]>(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [ListPrice] > (0.00)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductListPriceHistory', @level2type = N'CONSTRAINT', @level2name = N'CK_ProductListPriceHistory_ListPrice';


GO





ALTER TABLE [Production].[ProductListPriceHistory]
    ADD CONSTRAINT [CK_ProductListPriceHistory_EndDate] CHECK ([EndDate]>=[StartDate] OR [EndDate] IS NULL);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NULL', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductListPriceHistory', @level2type = N'CONSTRAINT', @level2name = N'CK_ProductListPriceHistory_EndDate';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Changes in the list price of a product over time.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductListPriceHistory';


GO





CREATE TABLE [Production].[ProductModel] (
    [ProductModelID]     INT                                                            IDENTITY (1, 1) NOT NULL,
    [Name]               [dbo].[Name]                                                   NOT NULL,
    [CatalogDescription] XML(CONTENT [Production].[ProductDescriptionSchemaCollection]) NULL,
    [Instructions]       XML(CONTENT [Production].[ManuInstructionsSchemaCollection])   NULL,
    [rowguid]            UNIQUEIDENTIFIER                                               ROWGUIDCOL NOT NULL,
    [ModifiedDate]       DATETIME                                                       NOT NULL
);


GO

ALTER TABLE [Production].[ProductModel]
    ADD CONSTRAINT [PK_ProductModel_ProductModelID] PRIMARY KEY CLUSTERED ([ProductModelID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModel', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductModel_ProductModelID';


GO





ALTER TABLE [Production].[ProductModel]
    ADD CONSTRAINT [DF_ProductModel_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModel', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductModel_ModifiedDate';


GO





ALTER TABLE [Production].[ProductModel]
    ADD CONSTRAINT [DF_ProductModel_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModel', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductModel_rowguid';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductModel_Name]
    ON [Production].[ProductModel]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModel', @level2type = N'INDEX', @level2name = N'AK_ProductModel_Name';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductModel_rowguid]
    ON [Production].[ProductModel]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModel', @level2type = N'INDEX', @level2name = N'AK_ProductModel_rowguid';


GO





CREATE PRIMARY XML INDEX [PXML_ProductModel_CatalogDescription]
    ON [Production].[ProductModel]([CatalogDescription])
    WITH (PAD_INDEX = OFF);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary XML index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModel', @level2type = N'INDEX', @level2name = N'PXML_ProductModel_CatalogDescription';


GO





CREATE PRIMARY XML INDEX [PXML_ProductModel_Instructions]
    ON [Production].[ProductModel]([Instructions])
    WITH (PAD_INDEX = OFF);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary XML index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModel', @level2type = N'INDEX', @level2name = N'PXML_ProductModel_Instructions';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Product model classification.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModel';


GO





CREATE TABLE [Production].[ProductModelIllustration] (
    [ProductModelID] INT      NOT NULL,
    [IllustrationID] INT      NOT NULL,
    [ModifiedDate]   DATETIME NOT NULL
);


GO

ALTER TABLE [Production].[ProductModelIllustration]
    ADD CONSTRAINT [PK_ProductModelIllustration_ProductModelID_IllustrationID] PRIMARY KEY CLUSTERED ([ProductModelID] ASC, [IllustrationID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModelIllustration', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductModelIllustration_ProductModelID_IllustrationID';


GO





ALTER TABLE [Production].[ProductModelIllustration]
    ADD CONSTRAINT [FK_ProductModelIllustration_ProductModel_ProductModelID] FOREIGN KEY ([ProductModelID]) REFERENCES [Production].[ProductModel] ([ProductModelID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing ProductModel.ProductModelID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModelIllustration', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductModelIllustration_ProductModel_ProductModelID';


GO





ALTER TABLE [Production].[ProductModelIllustration]
    ADD CONSTRAINT [FK_ProductModelIllustration_Illustration_IllustrationID] FOREIGN KEY ([IllustrationID]) REFERENCES [Production].[Illustration] ([IllustrationID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Illustration.IllustrationID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModelIllustration', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductModelIllustration_Illustration_IllustrationID';


GO





ALTER TABLE [Production].[ProductModelIllustration]
    ADD CONSTRAINT [DF_ProductModelIllustration_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModelIllustration', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductModelIllustration_ModifiedDate';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-reference table mapping product models and illustrations.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModelIllustration';


GO





CREATE TABLE [Production].[ProductModelProductDescriptionCulture] (
    [ProductModelID]       INT       NOT NULL,
    [ProductDescriptionID] INT       NOT NULL,
    [CultureID]            NCHAR (6) NOT NULL,
    [ModifiedDate]         DATETIME  NOT NULL
);


GO

ALTER TABLE [Production].[ProductModelProductDescriptionCulture]
    ADD CONSTRAINT [PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID] PRIMARY KEY CLUSTERED ([ProductModelID] ASC, [ProductDescriptionID] ASC, [CultureID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModelProductDescriptionCulture', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID';


GO





ALTER TABLE [Production].[ProductModelProductDescriptionCulture]
    ADD CONSTRAINT [FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID] FOREIGN KEY ([ProductDescriptionID]) REFERENCES [Production].[ProductDescription] ([ProductDescriptionID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing ProductDescription.ProductDescriptionID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModelProductDescriptionCulture', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID';


GO





ALTER TABLE [Production].[ProductModelProductDescriptionCulture]
    ADD CONSTRAINT [FK_ProductModelProductDescriptionCulture_Culture_CultureID] FOREIGN KEY ([CultureID]) REFERENCES [Production].[Culture] ([CultureID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Culture.CultureID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModelProductDescriptionCulture', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductModelProductDescriptionCulture_Culture_CultureID';


GO





ALTER TABLE [Production].[ProductModelProductDescriptionCulture]
    ADD CONSTRAINT [FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID] FOREIGN KEY ([ProductModelID]) REFERENCES [Production].[ProductModel] ([ProductModelID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing ProductModel.ProductModelID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModelProductDescriptionCulture', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID';


GO





ALTER TABLE [Production].[ProductModelProductDescriptionCulture]
    ADD CONSTRAINT [DF_ProductModelProductDescriptionCulture_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModelProductDescriptionCulture', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductModelProductDescriptionCulture_ModifiedDate';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-reference table mapping product descriptions and the language the description is written in.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductModelProductDescriptionCulture';


GO





CREATE TABLE [Production].[BillOfMaterials] (
    [BillOfMaterialsID] INT            IDENTITY (1, 1) NOT NULL,
    [ProductAssemblyID] INT            NULL,
    [ComponentID]       INT            NOT NULL,
    [StartDate]         DATETIME       NOT NULL,
    [EndDate]           DATETIME       NULL,
    [UnitMeasureCode]   NCHAR (3)      NOT NULL,
    [BOMLevel]          SMALLINT       NOT NULL,
    [PerAssemblyQty]    DECIMAL (8, 2) NOT NULL,
    [ModifiedDate]      DATETIME       NOT NULL
);


GO

ALTER TABLE [Production].[BillOfMaterials]
    ADD CONSTRAINT [PK_BillOfMaterials_BillOfMaterialsID] PRIMARY KEY NONCLUSTERED ([BillOfMaterialsID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'BillOfMaterials', @level2type = N'CONSTRAINT', @level2name = N'PK_BillOfMaterials_BillOfMaterialsID';


GO





ALTER TABLE [Production].[BillOfMaterials]
    ADD CONSTRAINT [FK_BillOfMaterials_Product_ProductAssemblyID] FOREIGN KEY ([ProductAssemblyID]) REFERENCES [Production].[Product] ([ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Product.ProductAssemblyID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'BillOfMaterials', @level2type = N'CONSTRAINT', @level2name = N'FK_BillOfMaterials_Product_ProductAssemblyID';


GO





ALTER TABLE [Production].[BillOfMaterials]
    ADD CONSTRAINT [FK_BillOfMaterials_Product_ComponentID] FOREIGN KEY ([ComponentID]) REFERENCES [Production].[Product] ([ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Product.ComponentID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'BillOfMaterials', @level2type = N'CONSTRAINT', @level2name = N'FK_BillOfMaterials_Product_ComponentID';


GO





ALTER TABLE [Production].[BillOfMaterials]
    ADD CONSTRAINT [FK_BillOfMaterials_UnitMeasure_UnitMeasureCode] FOREIGN KEY ([UnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing UnitMeasure.UnitMeasureCode.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'BillOfMaterials', @level2type = N'CONSTRAINT', @level2name = N'FK_BillOfMaterials_UnitMeasure_UnitMeasureCode';


GO





ALTER TABLE [Production].[BillOfMaterials]
    ADD CONSTRAINT [DF_BillOfMaterials_StartDate] DEFAULT (getdate()) FOR [StartDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'BillOfMaterials', @level2type = N'CONSTRAINT', @level2name = N'DF_BillOfMaterials_StartDate';


GO





ALTER TABLE [Production].[BillOfMaterials]
    ADD CONSTRAINT [DF_BillOfMaterials_PerAssemblyQty] DEFAULT ((1.00)) FOR [PerAssemblyQty];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 1.0', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'BillOfMaterials', @level2type = N'CONSTRAINT', @level2name = N'DF_BillOfMaterials_PerAssemblyQty';


GO





ALTER TABLE [Production].[BillOfMaterials]
    ADD CONSTRAINT [DF_BillOfMaterials_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'BillOfMaterials', @level2type = N'CONSTRAINT', @level2name = N'DF_BillOfMaterials_ModifiedDate';


GO





ALTER TABLE [Production].[BillOfMaterials]
    ADD CONSTRAINT [CK_BillOfMaterials_EndDate] CHECK ([EndDate]>[StartDate] OR [EndDate] IS NULL);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint EndDate] > [StartDate] OR [EndDate] IS NULL', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'BillOfMaterials', @level2type = N'CONSTRAINT', @level2name = N'CK_BillOfMaterials_EndDate';


GO





ALTER TABLE [Production].[BillOfMaterials]
    ADD CONSTRAINT [CK_BillOfMaterials_ProductAssemblyID] CHECK ([ProductAssemblyID]<>[ComponentID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [ProductAssemblyID] <> [ComponentID]', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'BillOfMaterials', @level2type = N'CONSTRAINT', @level2name = N'CK_BillOfMaterials_ProductAssemblyID';


GO





ALTER TABLE [Production].[BillOfMaterials]
    ADD CONSTRAINT [CK_BillOfMaterials_BOMLevel] CHECK ([ProductAssemblyID] IS NULL AND [BOMLevel]=(0) AND [PerAssemblyQty]=(1.00) OR [ProductAssemblyID] IS NOT NULL AND [BOMLevel]>=(1));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [ProductAssemblyID] IS NULL AND [BOMLevel] = (0) AND [PerAssemblyQty] = (1) OR [ProductAssemblyID] IS NOT NULL AND [BOMLevel] >= (1)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'BillOfMaterials', @level2type = N'CONSTRAINT', @level2name = N'CK_BillOfMaterials_BOMLevel';


GO





ALTER TABLE [Production].[BillOfMaterials]
    ADD CONSTRAINT [CK_BillOfMaterials_PerAssemblyQty] CHECK ([PerAssemblyQty]>=(1.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [PerAssemblyQty] >= (1.00)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'BillOfMaterials', @level2type = N'CONSTRAINT', @level2name = N'CK_BillOfMaterials_PerAssemblyQty';


GO





CREATE UNIQUE CLUSTERED INDEX [AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate]
    ON [Production].[BillOfMaterials]([ProductAssemblyID] ASC, [ComponentID] ASC, [StartDate] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Clustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'BillOfMaterials', @level2type = N'INDEX', @level2name = N'AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate';


GO





CREATE NONCLUSTERED INDEX [IX_BillOfMaterials_UnitMeasureCode]
    ON [Production].[BillOfMaterials]([UnitMeasureCode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'BillOfMaterials', @level2type = N'INDEX', @level2name = N'IX_BillOfMaterials_UnitMeasureCode';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Items required to make bicycles and bicycle subassemblies. It identifies the heirarchical relationship between a parent product and its components.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'BillOfMaterials';


GO





CREATE TABLE [Production].[ProductPhoto] (
    [ProductPhotoID]         INT             IDENTITY (1, 1) NOT NULL,
    [ThumbNailPhoto]         VARBINARY (MAX) NULL,
    [ThumbnailPhotoFileName] NVARCHAR (50)   NULL,
    [LargePhoto]             VARBINARY (MAX) NULL,
    [LargePhotoFileName]     NVARCHAR (50)   NULL,
    [ModifiedDate]           DATETIME        NOT NULL
);


GO

ALTER TABLE [Production].[ProductPhoto]
    ADD CONSTRAINT [PK_ProductPhoto_ProductPhotoID] PRIMARY KEY CLUSTERED ([ProductPhotoID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductPhoto', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductPhoto_ProductPhotoID';


GO





ALTER TABLE [Production].[ProductPhoto]
    ADD CONSTRAINT [DF_ProductPhoto_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductPhoto', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductPhoto_ModifiedDate';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Product images.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductPhoto';


GO





CREATE TABLE [Production].[ProductProductPhoto] (
    [ProductID]      INT          NOT NULL,
    [ProductPhotoID] INT          NOT NULL,
    [Primary]        [dbo].[Flag] NOT NULL,
    [ModifiedDate]   DATETIME     NOT NULL
);


GO

ALTER TABLE [Production].[ProductProductPhoto]
    ADD CONSTRAINT [PK_ProductProductPhoto_ProductID_ProductPhotoID] PRIMARY KEY NONCLUSTERED ([ProductID] ASC, [ProductPhotoID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductProductPhoto', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductProductPhoto_ProductID_ProductPhotoID';


GO





ALTER TABLE [Production].[ProductProductPhoto]
    ADD CONSTRAINT [FK_ProductProductPhoto_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Product.ProductID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductProductPhoto', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductProductPhoto_Product_ProductID';


GO





ALTER TABLE [Production].[ProductProductPhoto]
    ADD CONSTRAINT [FK_ProductProductPhoto_ProductPhoto_ProductPhotoID] FOREIGN KEY ([ProductPhotoID]) REFERENCES [Production].[ProductPhoto] ([ProductPhotoID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing ProductPhoto.ProductPhotoID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductProductPhoto', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductProductPhoto_ProductPhoto_ProductPhotoID';


GO





ALTER TABLE [Production].[ProductProductPhoto]
    ADD CONSTRAINT [DF_ProductProductPhoto_Primary] DEFAULT ((0)) FOR [Primary];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0 (FALSE)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductProductPhoto', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductProductPhoto_Primary';


GO





ALTER TABLE [Production].[ProductProductPhoto]
    ADD CONSTRAINT [DF_ProductProductPhoto_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductProductPhoto', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductProductPhoto_ModifiedDate';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-reference table mapping products and product photos.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductProductPhoto';


GO





CREATE TABLE [Production].[TransactionHistory] (
    [TransactionID]        INT       IDENTITY (100000, 1) NOT NULL,
    [ProductID]            INT       NOT NULL,
    [ReferenceOrderID]     INT       NOT NULL,
    [ReferenceOrderLineID] INT       NOT NULL,
    [TransactionDate]      DATETIME  NOT NULL,
    [TransactionType]      NCHAR (1) NOT NULL,
    [Quantity]             INT       NOT NULL,
    [ActualCost]           MONEY     NOT NULL,
    [ModifiedDate]         DATETIME  NOT NULL
);


GO

ALTER TABLE [Production].[TransactionHistory]
    ADD CONSTRAINT [PK_TransactionHistory_TransactionID] PRIMARY KEY CLUSTERED ([TransactionID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'TransactionHistory', @level2type = N'CONSTRAINT', @level2name = N'PK_TransactionHistory_TransactionID';


GO





ALTER TABLE [Production].[TransactionHistory]
    ADD CONSTRAINT [FK_TransactionHistory_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Product.ProductID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'TransactionHistory', @level2type = N'CONSTRAINT', @level2name = N'FK_TransactionHistory_Product_ProductID';


GO





ALTER TABLE [Production].[TransactionHistory]
    ADD CONSTRAINT [DF_TransactionHistory_TransactionDate] DEFAULT (getdate()) FOR [TransactionDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'TransactionHistory', @level2type = N'CONSTRAINT', @level2name = N'DF_TransactionHistory_TransactionDate';


GO





ALTER TABLE [Production].[TransactionHistory]
    ADD CONSTRAINT [DF_TransactionHistory_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'TransactionHistory', @level2type = N'CONSTRAINT', @level2name = N'DF_TransactionHistory_ModifiedDate';


GO





ALTER TABLE [Production].[TransactionHistory]
    ADD CONSTRAINT [DF_TransactionHistory_ReferenceOrderLineID] DEFAULT ((0)) FOR [ReferenceOrderLineID];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'TransactionHistory', @level2type = N'CONSTRAINT', @level2name = N'DF_TransactionHistory_ReferenceOrderLineID';


GO





ALTER TABLE [Production].[TransactionHistory]
    ADD CONSTRAINT [CK_TransactionHistory_TransactionType] CHECK (upper([TransactionType])='P' OR upper([TransactionType])='S' OR upper([TransactionType])='W');


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [TransactionType]=''p'' OR [TransactionType]=''s'' OR [TransactionType]=''w'' OR [TransactionType]=''P'' OR [TransactionType]=''S'' OR [TransactionType]=''W'')', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'TransactionHistory', @level2type = N'CONSTRAINT', @level2name = N'CK_TransactionHistory_TransactionType';


GO





CREATE NONCLUSTERED INDEX [IX_TransactionHistory_ProductID]
    ON [Production].[TransactionHistory]([ProductID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'TransactionHistory', @level2type = N'INDEX', @level2name = N'IX_TransactionHistory_ProductID';


GO





CREATE NONCLUSTERED INDEX [IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID]
    ON [Production].[TransactionHistory]([ReferenceOrderID] ASC, [ReferenceOrderLineID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'TransactionHistory', @level2type = N'INDEX', @level2name = N'IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Record of each purchase order, sales order, or work order transaction year to date.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'TransactionHistory';


GO





CREATE TABLE [Production].[ProductReview] (
    [ProductReviewID] INT             IDENTITY (1, 1) NOT NULL,
    [ProductID]       INT             NOT NULL,
    [ReviewerName]    [dbo].[Name]    NOT NULL,
    [ReviewDate]      DATETIME        NOT NULL,
    [EmailAddress]    NVARCHAR (50)   NOT NULL,
    [Rating]          INT             NOT NULL,
    [Comments]        NVARCHAR (3850) NULL,
    [ModifiedDate]    DATETIME        NOT NULL
);


GO

ALTER TABLE [Production].[ProductReview]
    ADD CONSTRAINT [PK_ProductReview_ProductReviewID] PRIMARY KEY CLUSTERED ([ProductReviewID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductReview', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductReview_ProductReviewID';


GO





ALTER TABLE [Production].[ProductReview]
    ADD CONSTRAINT [FK_ProductReview_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Product.ProductID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductReview', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductReview_Product_ProductID';


GO





ALTER TABLE [Production].[ProductReview]
    ADD CONSTRAINT [DF_ProductReview_ReviewDate] DEFAULT (getdate()) FOR [ReviewDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductReview', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductReview_ReviewDate';


GO





ALTER TABLE [Production].[ProductReview]
    ADD CONSTRAINT [DF_ProductReview_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductReview', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductReview_ModifiedDate';


GO





ALTER TABLE [Production].[ProductReview]
    ADD CONSTRAINT [CK_ProductReview_Rating] CHECK ([Rating]>=(1) AND [Rating]<=(5));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [Rating] BETWEEN (1) AND (5)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductReview', @level2type = N'CONSTRAINT', @level2name = N'CK_ProductReview_Rating';


GO





CREATE NONCLUSTERED INDEX [IX_ProductReview_ProductID_Name]
    ON [Production].[ProductReview]([ProductID] ASC, [ReviewerName] ASC)
    INCLUDE([Comments]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductReview', @level2type = N'INDEX', @level2name = N'IX_ProductReview_ProductID_Name';


GO





CREATE FULLTEXT INDEX ON [Production].[ProductReview]
    ([Comments] LANGUAGE 1033)
    KEY INDEX [PK_ProductReview_ProductReviewID]
    ON [AW2016FullTextCatalog];


GO



EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Customer reviews of products they have purchased.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductReview';


GO





CREATE TABLE [Production].[TransactionHistoryArchive] (
    [TransactionID]        INT       NOT NULL,
    [ProductID]            INT       NOT NULL,
    [ReferenceOrderID]     INT       NOT NULL,
    [ReferenceOrderLineID] INT       NOT NULL,
    [TransactionDate]      DATETIME  NOT NULL,
    [TransactionType]      NCHAR (1) NOT NULL,
    [Quantity]             INT       NOT NULL,
    [ActualCost]           MONEY     NOT NULL,
    [ModifiedDate]         DATETIME  NOT NULL
);


GO

ALTER TABLE [Production].[TransactionHistoryArchive]
    ADD CONSTRAINT [PK_TransactionHistoryArchive_TransactionID] PRIMARY KEY CLUSTERED ([TransactionID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'TransactionHistoryArchive', @level2type = N'CONSTRAINT', @level2name = N'PK_TransactionHistoryArchive_TransactionID';


GO





ALTER TABLE [Production].[TransactionHistoryArchive]
    ADD CONSTRAINT [DF_TransactionHistoryArchive_ReferenceOrderLineID] DEFAULT ((0)) FOR [ReferenceOrderLineID];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'TransactionHistoryArchive', @level2type = N'CONSTRAINT', @level2name = N'DF_TransactionHistoryArchive_ReferenceOrderLineID';


GO





ALTER TABLE [Production].[TransactionHistoryArchive]
    ADD CONSTRAINT [DF_TransactionHistoryArchive_TransactionDate] DEFAULT (getdate()) FOR [TransactionDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'TransactionHistoryArchive', @level2type = N'CONSTRAINT', @level2name = N'DF_TransactionHistoryArchive_TransactionDate';


GO





ALTER TABLE [Production].[TransactionHistoryArchive]
    ADD CONSTRAINT [DF_TransactionHistoryArchive_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'TransactionHistoryArchive', @level2type = N'CONSTRAINT', @level2name = N'DF_TransactionHistoryArchive_ModifiedDate';


GO





ALTER TABLE [Production].[TransactionHistoryArchive]
    ADD CONSTRAINT [CK_TransactionHistoryArchive_TransactionType] CHECK (upper([TransactionType])='P' OR upper([TransactionType])='S' OR upper([TransactionType])='W');


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [TransactionType]=''p'' OR [TransactionType]=''s'' OR [TransactionType]=''w'' OR [TransactionType]=''P'' OR [TransactionType]=''S'' OR [TransactionType]=''W''', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'TransactionHistoryArchive', @level2type = N'CONSTRAINT', @level2name = N'CK_TransactionHistoryArchive_TransactionType';


GO





CREATE NONCLUSTERED INDEX [IX_TransactionHistoryArchive_ProductID]
    ON [Production].[TransactionHistoryArchive]([ProductID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'TransactionHistoryArchive', @level2type = N'INDEX', @level2name = N'IX_TransactionHistoryArchive_ProductID';


GO





CREATE NONCLUSTERED INDEX [IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID]
    ON [Production].[TransactionHistoryArchive]([ReferenceOrderID] ASC, [ReferenceOrderLineID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'TransactionHistoryArchive', @level2type = N'INDEX', @level2name = N'IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Transactions for previous years.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'TransactionHistoryArchive';


GO





CREATE TABLE [Production].[ProductSubcategory] (
    [ProductSubcategoryID] INT              IDENTITY (1, 1) NOT NULL,
    [ProductCategoryID]    INT              NOT NULL,
    [Name]                 [dbo].[Name]     NOT NULL,
    [rowguid]              UNIQUEIDENTIFIER ROWGUIDCOL NOT NULL,
    [ModifiedDate]         DATETIME         NOT NULL
);


GO

ALTER TABLE [Production].[ProductSubcategory]
    ADD CONSTRAINT [PK_ProductSubcategory_ProductSubcategoryID] PRIMARY KEY CLUSTERED ([ProductSubcategoryID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductSubcategory', @level2type = N'CONSTRAINT', @level2name = N'PK_ProductSubcategory_ProductSubcategoryID';


GO





ALTER TABLE [Production].[ProductSubcategory]
    ADD CONSTRAINT [FK_ProductSubcategory_ProductCategory_ProductCategoryID] FOREIGN KEY ([ProductCategoryID]) REFERENCES [Production].[ProductCategory] ([ProductCategoryID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing ProductCategory.ProductCategoryID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductSubcategory', @level2type = N'CONSTRAINT', @level2name = N'FK_ProductSubcategory_ProductCategory_ProductCategoryID';


GO





ALTER TABLE [Production].[ProductSubcategory]
    ADD CONSTRAINT [DF_ProductSubcategory_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductSubcategory', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductSubcategory_ModifiedDate';


GO





ALTER TABLE [Production].[ProductSubcategory]
    ADD CONSTRAINT [DF_ProductSubcategory_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductSubcategory', @level2type = N'CONSTRAINT', @level2name = N'DF_ProductSubcategory_rowguid';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductSubcategory_Name]
    ON [Production].[ProductSubcategory]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductSubcategory', @level2type = N'INDEX', @level2name = N'AK_ProductSubcategory_Name';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductSubcategory_rowguid]
    ON [Production].[ProductSubcategory]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductSubcategory', @level2type = N'INDEX', @level2name = N'AK_ProductSubcategory_rowguid';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Product subcategories. See ProductCategory table.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'ProductSubcategory';


GO





CREATE TABLE [Production].[UnitMeasure] (
    [UnitMeasureCode] NCHAR (3)    NOT NULL,
    [Name]            [dbo].[Name] NOT NULL,
    [ModifiedDate]    DATETIME     NOT NULL
);


GO

ALTER TABLE [Production].[UnitMeasure]
    ADD CONSTRAINT [PK_UnitMeasure_UnitMeasureCode] PRIMARY KEY CLUSTERED ([UnitMeasureCode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'UnitMeasure', @level2type = N'CONSTRAINT', @level2name = N'PK_UnitMeasure_UnitMeasureCode';


GO





ALTER TABLE [Production].[UnitMeasure]
    ADD CONSTRAINT [DF_UnitMeasure_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'UnitMeasure', @level2type = N'CONSTRAINT', @level2name = N'DF_UnitMeasure_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_UnitMeasure_Name]
    ON [Production].[UnitMeasure]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'UnitMeasure', @level2type = N'INDEX', @level2name = N'AK_UnitMeasure_Name';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit of measure lookup table.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'UnitMeasure';


GO





CREATE TABLE [Production].[WorkOrder] (
    [WorkOrderID]   INT      IDENTITY (1, 1) NOT NULL,
    [ProductID]     INT      NOT NULL,
    [OrderQty]      INT      NOT NULL,
    [StockedQty]    AS       (isnull([OrderQty]-[ScrappedQty],(0))),
    [ScrappedQty]   SMALLINT NOT NULL,
    [StartDate]     DATETIME NOT NULL,
    [EndDate]       DATETIME NULL,
    [DueDate]       DATETIME NOT NULL,
    [ScrapReasonID] SMALLINT NULL,
    [ModifiedDate]  DATETIME NOT NULL
);


GO

ALTER TABLE [Production].[WorkOrder]
    ADD CONSTRAINT [PK_WorkOrder_WorkOrderID] PRIMARY KEY CLUSTERED ([WorkOrderID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrder', @level2type = N'CONSTRAINT', @level2name = N'PK_WorkOrder_WorkOrderID';


GO





ALTER TABLE [Production].[WorkOrder]
    ADD CONSTRAINT [FK_WorkOrder_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Product.ProductID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrder', @level2type = N'CONSTRAINT', @level2name = N'FK_WorkOrder_Product_ProductID';


GO





ALTER TABLE [Production].[WorkOrder]
    ADD CONSTRAINT [FK_WorkOrder_ScrapReason_ScrapReasonID] FOREIGN KEY ([ScrapReasonID]) REFERENCES [Production].[ScrapReason] ([ScrapReasonID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing ScrapReason.ScrapReasonID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrder', @level2type = N'CONSTRAINT', @level2name = N'FK_WorkOrder_ScrapReason_ScrapReasonID';


GO





ALTER TABLE [Production].[WorkOrder]
    ADD CONSTRAINT [DF_WorkOrder_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrder', @level2type = N'CONSTRAINT', @level2name = N'DF_WorkOrder_ModifiedDate';


GO





ALTER TABLE [Production].[WorkOrder]
    ADD CONSTRAINT [CK_WorkOrder_OrderQty] CHECK ([OrderQty]>(0));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [OrderQty] > (0)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrder', @level2type = N'CONSTRAINT', @level2name = N'CK_WorkOrder_OrderQty';


GO





ALTER TABLE [Production].[WorkOrder]
    ADD CONSTRAINT [CK_WorkOrder_ScrappedQty] CHECK ([ScrappedQty]>=(0));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [ScrappedQty] >= (0)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrder', @level2type = N'CONSTRAINT', @level2name = N'CK_WorkOrder_ScrappedQty';


GO





ALTER TABLE [Production].[WorkOrder]
    ADD CONSTRAINT [CK_WorkOrder_EndDate] CHECK ([EndDate]>=[StartDate] OR [EndDate] IS NULL);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NULL', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrder', @level2type = N'CONSTRAINT', @level2name = N'CK_WorkOrder_EndDate';


GO





CREATE NONCLUSTERED INDEX [IX_WorkOrder_ScrapReasonID]
    ON [Production].[WorkOrder]([ScrapReasonID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrder', @level2type = N'INDEX', @level2name = N'IX_WorkOrder_ScrapReasonID';


GO





CREATE NONCLUSTERED INDEX [IX_WorkOrder_ProductID]
    ON [Production].[WorkOrder]([ProductID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrder', @level2type = N'INDEX', @level2name = N'IX_WorkOrder_ProductID';


GO






CREATE TRIGGER [Production].[iWorkOrder] ON [Production].[WorkOrder] 
AFTER INSERT AS 
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0 
        RETURN;

    SET NOCOUNT ON;

    BEGIN TRY
        INSERT INTO [Production].[TransactionHistory](
            [ProductID]
            ,[ReferenceOrderID]
            ,[TransactionType]
            ,[TransactionDate]
            ,[Quantity]
            ,[ActualCost])
        SELECT 
            inserted.[ProductID]
            ,inserted.[WorkOrderID]
            ,'W'
            ,GETDATE()
            ,inserted.[OrderQty]
            ,0
        FROM inserted;
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

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'AFTER INSERT trigger that inserts a row in the TransactionHistory table.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrder', @level2type = N'TRIGGER', @level2name = N'iWorkOrder';


GO






CREATE TRIGGER [Production].[uWorkOrder] ON [Production].[WorkOrder] 
AFTER UPDATE AS 
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0 
        RETURN;

    SET NOCOUNT ON;

    BEGIN TRY
        IF UPDATE([ProductID]) OR UPDATE([OrderQty])
        BEGIN
            INSERT INTO [Production].[TransactionHistory](
                [ProductID]
                ,[ReferenceOrderID]
                ,[TransactionType]
                ,[TransactionDate]
                ,[Quantity])
            SELECT 
                inserted.[ProductID]
                ,inserted.[WorkOrderID]
                ,'W'
                ,GETDATE()
                ,inserted.[OrderQty]
            FROM inserted;
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

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'AFTER UPDATE trigger that inserts a row in the TransactionHistory table, updates ModifiedDate in the WorkOrder table.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrder', @level2type = N'TRIGGER', @level2name = N'uWorkOrder';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Manufacturing work orders.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrder';


GO





CREATE TABLE [Production].[Culture] (
    [CultureID]    NCHAR (6)    NOT NULL,
    [Name]         [dbo].[Name] NOT NULL,
    [ModifiedDate] DATETIME     NOT NULL
);


GO

ALTER TABLE [Production].[Culture]
    ADD CONSTRAINT [PK_Culture_CultureID] PRIMARY KEY CLUSTERED ([CultureID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Culture', @level2type = N'CONSTRAINT', @level2name = N'PK_Culture_CultureID';


GO





ALTER TABLE [Production].[Culture]
    ADD CONSTRAINT [DF_Culture_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Culture', @level2type = N'CONSTRAINT', @level2name = N'DF_Culture_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Culture_Name]
    ON [Production].[Culture]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Culture', @level2type = N'INDEX', @level2name = N'AK_Culture_Name';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lookup table containing the languages in which some AdventureWorks data is stored.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Culture';


GO





CREATE TABLE [Production].[WorkOrderRouting] (
    [WorkOrderID]        INT            NOT NULL,
    [ProductID]          INT            NOT NULL,
    [OperationSequence]  SMALLINT       NOT NULL,
    [LocationID]         SMALLINT       NOT NULL,
    [ScheduledStartDate] DATETIME       NOT NULL,
    [ScheduledEndDate]   DATETIME       NOT NULL,
    [ActualStartDate]    DATETIME       NULL,
    [ActualEndDate]      DATETIME       NULL,
    [ActualResourceHrs]  DECIMAL (9, 4) NULL,
    [PlannedCost]        MONEY          NOT NULL,
    [ActualCost]         MONEY          NULL,
    [ModifiedDate]       DATETIME       NOT NULL
);


GO

ALTER TABLE [Production].[WorkOrderRouting]
    ADD CONSTRAINT [PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence] PRIMARY KEY CLUSTERED ([WorkOrderID] ASC, [ProductID] ASC, [OperationSequence] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrderRouting', @level2type = N'CONSTRAINT', @level2name = N'PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence';


GO





ALTER TABLE [Production].[WorkOrderRouting]
    ADD CONSTRAINT [FK_WorkOrderRouting_Location_LocationID] FOREIGN KEY ([LocationID]) REFERENCES [Production].[Location] ([LocationID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Location.LocationID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrderRouting', @level2type = N'CONSTRAINT', @level2name = N'FK_WorkOrderRouting_Location_LocationID';


GO





ALTER TABLE [Production].[WorkOrderRouting]
    ADD CONSTRAINT [FK_WorkOrderRouting_WorkOrder_WorkOrderID] FOREIGN KEY ([WorkOrderID]) REFERENCES [Production].[WorkOrder] ([WorkOrderID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing WorkOrder.WorkOrderID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrderRouting', @level2type = N'CONSTRAINT', @level2name = N'FK_WorkOrderRouting_WorkOrder_WorkOrderID';


GO





ALTER TABLE [Production].[WorkOrderRouting]
    ADD CONSTRAINT [DF_WorkOrderRouting_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrderRouting', @level2type = N'CONSTRAINT', @level2name = N'DF_WorkOrderRouting_ModifiedDate';


GO





ALTER TABLE [Production].[WorkOrderRouting]
    ADD CONSTRAINT [CK_WorkOrderRouting_ScheduledEndDate] CHECK ([ScheduledEndDate]>=[ScheduledStartDate]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [ScheduledEndDate] >= [ScheduledStartDate]', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrderRouting', @level2type = N'CONSTRAINT', @level2name = N'CK_WorkOrderRouting_ScheduledEndDate';


GO





ALTER TABLE [Production].[WorkOrderRouting]
    ADD CONSTRAINT [CK_WorkOrderRouting_ActualEndDate] CHECK ([ActualEndDate]>=[ActualStartDate] OR [ActualEndDate] IS NULL OR [ActualStartDate] IS NULL);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [ActualEndDate] >= [ActualStartDate] OR [ActualEndDate] IS NULL OR [ActualStartDate] IS NULL', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrderRouting', @level2type = N'CONSTRAINT', @level2name = N'CK_WorkOrderRouting_ActualEndDate';


GO





ALTER TABLE [Production].[WorkOrderRouting]
    ADD CONSTRAINT [CK_WorkOrderRouting_ActualResourceHrs] CHECK ([ActualResourceHrs]>=(0.0000));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [ActualResourceHrs] >= (0.0000)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrderRouting', @level2type = N'CONSTRAINT', @level2name = N'CK_WorkOrderRouting_ActualResourceHrs';


GO





ALTER TABLE [Production].[WorkOrderRouting]
    ADD CONSTRAINT [CK_WorkOrderRouting_PlannedCost] CHECK ([PlannedCost]>(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [PlannedCost] > (0.00)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrderRouting', @level2type = N'CONSTRAINT', @level2name = N'CK_WorkOrderRouting_PlannedCost';


GO





ALTER TABLE [Production].[WorkOrderRouting]
    ADD CONSTRAINT [CK_WorkOrderRouting_ActualCost] CHECK ([ActualCost]>(0.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [ActualCost] > (0.00)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrderRouting', @level2type = N'CONSTRAINT', @level2name = N'CK_WorkOrderRouting_ActualCost';


GO





CREATE NONCLUSTERED INDEX [IX_WorkOrderRouting_ProductID]
    ON [Production].[WorkOrderRouting]([ProductID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrderRouting', @level2type = N'INDEX', @level2name = N'IX_WorkOrderRouting_ProductID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work order details.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'WorkOrderRouting';


GO





CREATE TABLE [Production].[Document] (
    [DocumentNode]    [sys].[hierarchyid] NOT NULL,
    [DocumentLevel]   AS                  ([DocumentNode].[GetLevel]()),
    [Title]           NVARCHAR (50)       NOT NULL,
    [Owner]           INT                 NOT NULL,
    [FolderFlag]      BIT                 NOT NULL,
    [FileName]        NVARCHAR (400)      NOT NULL,
    [FileExtension]   NVARCHAR (8)        NOT NULL,
    [Revision]        NCHAR (5)           NOT NULL,
    [ChangeNumber]    INT                 NOT NULL,
    [Status]          TINYINT             NOT NULL,
    [DocumentSummary] NVARCHAR (MAX)      NULL,
    [Document]        VARBINARY (MAX)     NULL,
    [rowguid]         UNIQUEIDENTIFIER    ROWGUIDCOL NOT NULL,
    [ModifiedDate]    DATETIME            NOT NULL,
    UNIQUE NONCLUSTERED ([rowguid] ASC)
);


GO

ALTER TABLE [Production].[Document]
    ADD CONSTRAINT [PK_Document_DocumentNode] PRIMARY KEY CLUSTERED ([DocumentNode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Document', @level2type = N'CONSTRAINT', @level2name = N'PK_Document_DocumentNode';


GO





ALTER TABLE [Production].[Document]
    ADD CONSTRAINT [FK_Document_Employee_Owner] FOREIGN KEY ([Owner]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Employee.BusinessEntityID.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Document', @level2type = N'CONSTRAINT', @level2name = N'FK_Document_Employee_Owner';


GO





ALTER TABLE [Production].[Document]
    ADD CONSTRAINT [DF_Document_FolderFlag] DEFAULT ((0)) FOR [FolderFlag];


GO



ALTER TABLE [Production].[Document]
    ADD CONSTRAINT [DF_Document_ChangeNumber] DEFAULT ((0)) FOR [ChangeNumber];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Document', @level2type = N'CONSTRAINT', @level2name = N'DF_Document_ChangeNumber';


GO





ALTER TABLE [Production].[Document]
    ADD CONSTRAINT [DF_Document_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Document', @level2type = N'CONSTRAINT', @level2name = N'DF_Document_rowguid';


GO





ALTER TABLE [Production].[Document]
    ADD CONSTRAINT [DF_Document_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Document', @level2type = N'CONSTRAINT', @level2name = N'DF_Document_ModifiedDate';


GO





ALTER TABLE [Production].[Document]
    ADD CONSTRAINT [CK_Document_Status] CHECK ([Status]>=(1) AND [Status]<=(3));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [Status] BETWEEN (1) AND (3)', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Document', @level2type = N'CONSTRAINT', @level2name = N'CK_Document_Status';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Document_DocumentLevel_DocumentNode]
    ON [Production].[Document]([DocumentLevel] ASC, [DocumentNode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Document', @level2type = N'INDEX', @level2name = N'AK_Document_DocumentLevel_DocumentNode';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Document_rowguid]
    ON [Production].[Document]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support FileStream.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Document', @level2type = N'INDEX', @level2name = N'AK_Document_rowguid';


GO





CREATE NONCLUSTERED INDEX [IX_Document_FileName_Revision]
    ON [Production].[Document]([FileName] ASC, [Revision] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Document', @level2type = N'INDEX', @level2name = N'IX_Document_FileName_Revision';


GO





CREATE FULLTEXT INDEX ON [Production].[Document]
    ([DocumentSummary] LANGUAGE 1033, [Document] TYPE COLUMN [FileExtension] LANGUAGE 1033)
    KEY INDEX [PK_Document_DocumentNode]
    ON [AW2016FullTextCatalog];


GO



EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Product maintenance documents.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'TABLE', @level1name = N'Document';


GO






CREATE VIEW [Production].[vProductAndDescription] 
WITH SCHEMABINDING 
AS 
-- View (indexed or standard) to display products and product descriptions by language.
SELECT 
    p.[ProductID] 
    ,p.[Name] 
    ,pm.[Name] AS [ProductModel] 
    ,pmx.[CultureID] 
    ,pd.[Description] 
FROM [Production].[Product] p 
    INNER JOIN [Production].[ProductModel] pm 
    ON p.[ProductModelID] = pm.[ProductModelID] 
    INNER JOIN [Production].[ProductModelProductDescriptionCulture] pmx 
    ON pm.[ProductModelID] = pmx.[ProductModelID] 
    INNER JOIN [Production].[ProductDescription] pd 
    ON pmx.[ProductDescriptionID] = pd.[ProductDescriptionID];
GO

CREATE UNIQUE CLUSTERED INDEX [IX_vProductAndDescription]
    ON [Production].[vProductAndDescription]([CultureID] ASC, [ProductID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Clustered index on the view vProductAndDescription.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'VIEW', @level1name = N'vProductAndDescription', @level2type = N'INDEX', @level2name = N'IX_vProductAndDescription';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Product names and descriptions. Product descriptions are provided in multiple languages.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'VIEW', @level1name = N'vProductAndDescription';


GO






CREATE VIEW [Production].[vProductModelCatalogDescription] 
AS 
SELECT 
    [ProductModelID] 
    ,[Name] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        declare namespace html="http://www.w3.org/1999/xhtml"; 
        (/p1:ProductDescription/p1:Summary/html:p)[1]', 'nvarchar(max)') AS [Summary] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        (/p1:ProductDescription/p1:Manufacturer/p1:Name)[1]', 'nvarchar(max)') AS [Manufacturer] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        (/p1:ProductDescription/p1:Manufacturer/p1:Copyright)[1]', 'nvarchar(30)') AS [Copyright] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        (/p1:ProductDescription/p1:Manufacturer/p1:ProductURL)[1]', 'nvarchar(256)') AS [ProductURL] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        declare namespace wm="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain"; 
        (/p1:ProductDescription/p1:Features/wm:Warranty/wm:WarrantyPeriod)[1]', 'nvarchar(256)') AS [WarrantyPeriod] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        declare namespace wm="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain"; 
        (/p1:ProductDescription/p1:Features/wm:Warranty/wm:Description)[1]', 'nvarchar(256)') AS [WarrantyDescription] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        declare namespace wm="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain"; 
        (/p1:ProductDescription/p1:Features/wm:Maintenance/wm:NoOfYears)[1]', 'nvarchar(256)') AS [NoOfYears] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        declare namespace wm="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain"; 
        (/p1:ProductDescription/p1:Features/wm:Maintenance/wm:Description)[1]', 'nvarchar(256)') AS [MaintenanceDescription] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        declare namespace wf="http://www.adventure-works.com/schemas/OtherFeatures"; 
        (/p1:ProductDescription/p1:Features/wf:wheel)[1]', 'nvarchar(256)') AS [Wheel] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        declare namespace wf="http://www.adventure-works.com/schemas/OtherFeatures"; 
        (/p1:ProductDescription/p1:Features/wf:saddle)[1]', 'nvarchar(256)') AS [Saddle] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        declare namespace wf="http://www.adventure-works.com/schemas/OtherFeatures"; 
        (/p1:ProductDescription/p1:Features/wf:pedal)[1]', 'nvarchar(256)') AS [Pedal] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        declare namespace wf="http://www.adventure-works.com/schemas/OtherFeatures"; 
        (/p1:ProductDescription/p1:Features/wf:BikeFrame)[1]', 'nvarchar(max)') AS [BikeFrame] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        declare namespace wf="http://www.adventure-works.com/schemas/OtherFeatures"; 
        (/p1:ProductDescription/p1:Features/wf:crankset)[1]', 'nvarchar(256)') AS [Crankset] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        (/p1:ProductDescription/p1:Picture/p1:Angle)[1]', 'nvarchar(256)') AS [PictureAngle] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        (/p1:ProductDescription/p1:Picture/p1:Size)[1]', 'nvarchar(256)') AS [PictureSize] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        (/p1:ProductDescription/p1:Picture/p1:ProductPhotoID)[1]', 'nvarchar(256)') AS [ProductPhotoID] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        (/p1:ProductDescription/p1:Specifications/Material)[1]', 'nvarchar(256)') AS [Material] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        (/p1:ProductDescription/p1:Specifications/Color)[1]', 'nvarchar(256)') AS [Color] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        (/p1:ProductDescription/p1:Specifications/ProductLine)[1]', 'nvarchar(256)') AS [ProductLine] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        (/p1:ProductDescription/p1:Specifications/Style)[1]', 'nvarchar(256)') AS [Style] 
    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 
        (/p1:ProductDescription/p1:Specifications/RiderExperience)[1]', 'nvarchar(1024)') AS [RiderExperience] 
    ,[rowguid] 
    ,[ModifiedDate]
FROM [Production].[ProductModel] 
WHERE [CatalogDescription] IS NOT NULL;
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Displays the content from each element in the xml column CatalogDescription for each product in the Production.ProductModel table that has catalog data.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'VIEW', @level1name = N'vProductModelCatalogDescription';


GO






CREATE VIEW [Production].[vProductModelInstructions] 
AS 
SELECT 
    [ProductModelID] 
    ,[Name] 
    ,[Instructions].value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions"; 
        (/root/text())[1]', 'nvarchar(max)') AS [Instructions] 
    ,[MfgInstructions].ref.value('@LocationID[1]', 'int') AS [LocationID] 
    ,[MfgInstructions].ref.value('@SetupHours[1]', 'decimal(9, 4)') AS [SetupHours] 
    ,[MfgInstructions].ref.value('@MachineHours[1]', 'decimal(9, 4)') AS [MachineHours] 
    ,[MfgInstructions].ref.value('@LaborHours[1]', 'decimal(9, 4)') AS [LaborHours] 
    ,[MfgInstructions].ref.value('@LotSize[1]', 'int') AS [LotSize] 
    ,[Steps].ref.value('string(.)[1]', 'nvarchar(1024)') AS [Step] 
    ,[rowguid] 
    ,[ModifiedDate]
FROM [Production].[ProductModel] 
CROSS APPLY [Instructions].nodes(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions"; 
    /root/Location') MfgInstructions(ref)
CROSS APPLY [MfgInstructions].ref.nodes('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions"; 
    step') Steps(ref);
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Displays the content from each element in the xml column Instructions for each product in the Production.ProductModel table that has manufacturing instructions.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'VIEW', @level1name = N'vProductModelInstructions';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains objects related to products, inventory, and manufacturing.', @level0type = N'SCHEMA', @level0name = N'Production';


GO



