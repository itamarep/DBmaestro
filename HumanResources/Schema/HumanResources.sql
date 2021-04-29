CREATE SCHEMA [HumanResources]
    AUTHORIZATION [dbo];


GO

CREATE XML SCHEMA COLLECTION [HumanResources].[HRResumeSchemaCollection]
    AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume" elementFormDefault="qualified">
  <xsd:element name="Address" type="t:AddressType" />
  <xsd:element name="Education" type="t:EducationType" />
  <xsd:element name="Employment" type="t:EmploymentType" />
  <xsd:element name="Location" type="t:LocationType" />
  <xsd:element name="Name" type="t:NameType" />
  <xsd:element name="Resume" type="t:ResumeType" />
  <xsd:element name="Telephone" type="t:TelephoneType" />
  <xsd:complexType name="AddressType">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Addr.Type" type="xsd:string" />
          <xsd:element name="Addr.OrgName" type="xsd:string" minOccurs="0" />
          <xsd:element name="Addr.Street" type="xsd:string" maxOccurs="unbounded" />
          <xsd:element name="Addr.Location">
            <xsd:complexType>
              <xsd:complexContent>
                <xsd:restriction base="xsd:anyType">
                  <xsd:sequence>
                    <xsd:element ref="t:Location" />
                  </xsd:sequence>
                </xsd:restriction>
              </xsd:complexContent>
            </xsd:complexType>
          </xsd:element>
          <xsd:element name="Addr.PostalCode" type="xsd:string" />
          <xsd:element name="Addr.Telephone" minOccurs="0">
            <xsd:complexType>
              <xsd:complexContent>
                <xsd:restriction base="xsd:anyType">
                  <xsd:sequence>
                    <xsd:element ref="t:Telephone" maxOccurs="unbounded" />
                  </xsd:sequence>
                </xsd:restriction>
              </xsd:complexContent>
            </xsd:complexType>
          </xsd:element>
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="EducationType">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Edu.Level" type="xsd:string" />
          <xsd:element name="Edu.StartDate" type="xsd:date" />
          <xsd:element name="Edu.EndDate" type="xsd:date" />
          <xsd:element name="Edu.Degree" type="xsd:string" minOccurs="0" />
          <xsd:element name="Edu.Major" type="xsd:string" minOccurs="0" />
          <xsd:element name="Edu.Minor" type="xsd:string" minOccurs="0" />
          <xsd:element name="Edu.GPA" type="xsd:string" minOccurs="0" />
          <xsd:element name="Edu.GPAAlternate" type="xsd:decimal" minOccurs="0" />
          <xsd:element name="Edu.GPAScale" type="xsd:decimal" minOccurs="0" />
          <xsd:element name="Edu.School" type="xsd:string" minOccurs="0" />
          <xsd:element name="Edu.Location" minOccurs="0">
            <xsd:complexType>
              <xsd:complexContent>
                <xsd:restriction base="xsd:anyType">
                  <xsd:sequence>
                    <xsd:element ref="t:Location" />
                  </xsd:sequence>
                </xsd:restriction>
              </xsd:complexContent>
            </xsd:complexType>
          </xsd:element>
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="EmploymentType">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Emp.StartDate" type="xsd:date" minOccurs="0" />
          <xsd:element name="Emp.EndDate" type="xsd:date" minOccurs="0" />
          <xsd:element name="Emp.OrgName" type="xsd:string" />
          <xsd:element name="Emp.JobTitle" type="xsd:string" />
          <xsd:element name="Emp.Responsibility" type="xsd:string" />
          <xsd:element name="Emp.FunctionCategory" type="xsd:string" minOccurs="0" />
          <xsd:element name="Emp.IndustryCategory" type="xsd:string" minOccurs="0" />
          <xsd:element name="Emp.Location" minOccurs="0">
            <xsd:complexType>
              <xsd:complexContent>
                <xsd:restriction base="xsd:anyType">
                  <xsd:sequence>
                    <xsd:element ref="t:Location" />
                  </xsd:sequence>
                </xsd:restriction>
              </xsd:complexContent>
            </xsd:complexType>
          </xsd:element>
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="LocationType">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Loc.CountryRegion" type="xsd:string" />
          <xsd:element name="Loc.State" type="xsd:string" minOccurs="0" />
          <xsd:element name="Loc.City" type="xsd:string" minOccurs="0" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="NameType">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Name.Prefix" type="xsd:string" minOccurs="0" />
          <xsd:element name="Name.First" type="xsd:string" />
          <xsd:element name="Name.Middle" type="xsd:string" minOccurs="0" />
          <xsd:element name="Name.Last" type="xsd:string" />
          <xsd:element name="Name.Suffix" type="xsd:string" minOccurs="0" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="ResumeType">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element ref="t:Name" />
          <xsd:element name="Skills" type="xsd:string" minOccurs="0" />
          <xsd:element ref="t:Employment" maxOccurs="unbounded" />
          <xsd:element ref="t:Education" maxOccurs="unbounded" />
          <xsd:element ref="t:Address" maxOccurs="unbounded" />
          <xsd:element ref="t:Telephone" minOccurs="0" />
          <xsd:element name="EMail" type="xsd:string" minOccurs="0" />
          <xsd:element name="WebSite" type="xsd:string" minOccurs="0" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="TelephoneType">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Tel.Type" type="xsd:anyType" minOccurs="0" />
          <xsd:element name="Tel.IntlCode" type="xsd:int" minOccurs="0" />
          <xsd:element name="Tel.AreaCode" type="xsd:int" minOccurs="0" />
          <xsd:element name="Tel.Number" type="xsd:string" />
          <xsd:element name="Tel.Extension" type="xsd:int" minOccurs="0" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
</xsd:schema>';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Collection of XML schemas for the Resume column in the HumanResources.JobCandidate table.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'XML SCHEMA COLLECTION', @level1name = N'HRResumeSchemaCollection';


GO






CREATE PROCEDURE [HumanResources].[uspUpdateEmployeeHireInfo]
    @BusinessEntityID [int], 
    @JobTitle [nvarchar](50), 
    @HireDate [datetime], 
    @RateChangeDate [datetime], 
    @Rate [money], 
    @PayFrequency [tinyint], 
    @CurrentFlag [dbo].[Flag] 
WITH EXECUTE AS CALLER
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [HumanResources].[Employee] 
        SET [JobTitle] = @JobTitle 
            ,[HireDate] = @HireDate 
            ,[CurrentFlag] = @CurrentFlag 
        WHERE [BusinessEntityID] = @BusinessEntityID;

        INSERT INTO [HumanResources].[EmployeePayHistory] 
            ([BusinessEntityID]
            ,[RateChangeDate]
            ,[Rate]
            ,[PayFrequency]) 
        VALUES (@BusinessEntityID, @RateChangeDate, @Rate, @PayFrequency);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
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

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updates the Employee table and inserts a new row in the EmployeePayHistory table with the values specified in the input parameters.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'PROCEDURE', @level1name = N'uspUpdateEmployeeHireInfo';


GO






CREATE PROCEDURE [HumanResources].[uspUpdateEmployeeLogin]
    @BusinessEntityID [int], 
    @OrganizationNode [hierarchyid],
    @LoginID [nvarchar](256),
    @JobTitle [nvarchar](50),
    @HireDate [datetime],
    @CurrentFlag [dbo].[Flag]
WITH EXECUTE AS CALLER
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE [HumanResources].[Employee] 
        SET [OrganizationNode] = @OrganizationNode 
            ,[LoginID] = @LoginID 
            ,[JobTitle] = @JobTitle 
            ,[HireDate] = @HireDate 
            ,[CurrentFlag] = @CurrentFlag 
        WHERE [BusinessEntityID] = @BusinessEntityID;
    END TRY
    BEGIN CATCH
        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updates the Employee table with the values specified in the input parameters for the given BusinessEntityID.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'PROCEDURE', @level1name = N'uspUpdateEmployeeLogin';


GO






CREATE PROCEDURE [HumanResources].[uspUpdateEmployeePersonalInfo]
    @BusinessEntityID [int], 
    @NationalIDNumber [nvarchar](15), 
    @BirthDate [datetime], 
    @MaritalStatus [nchar](1), 
    @Gender [nchar](1)
WITH EXECUTE AS CALLER
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE [HumanResources].[Employee] 
        SET [NationalIDNumber] = @NationalIDNumber 
            ,[BirthDate] = @BirthDate 
            ,[MaritalStatus] = @MaritalStatus 
            ,[Gender] = @Gender 
        WHERE [BusinessEntityID] = @BusinessEntityID;
    END TRY
    BEGIN CATCH
        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updates the Employee table with the values specified in the input parameters for the given EmployeeID.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'PROCEDURE', @level1name = N'uspUpdateEmployeePersonalInfo';


GO





CREATE TABLE [HumanResources].[EmployeePayHistory] (
    [BusinessEntityID] INT      NOT NULL,
    [RateChangeDate]   DATETIME NOT NULL,
    [Rate]             MONEY    NOT NULL,
    [PayFrequency]     TINYINT  NOT NULL,
    [ModifiedDate]     DATETIME NOT NULL
);


GO

ALTER TABLE [HumanResources].[EmployeePayHistory]
    ADD CONSTRAINT [PK_EmployeePayHistory_BusinessEntityID_RateChangeDate] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC, [RateChangeDate] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'EmployeePayHistory', @level2type = N'CONSTRAINT', @level2name = N'PK_EmployeePayHistory_BusinessEntityID_RateChangeDate';


GO





ALTER TABLE [HumanResources].[EmployeePayHistory]
    ADD CONSTRAINT [FK_EmployeePayHistory_Employee_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Employee.EmployeeID.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'EmployeePayHistory', @level2type = N'CONSTRAINT', @level2name = N'FK_EmployeePayHistory_Employee_BusinessEntityID';


GO





ALTER TABLE [HumanResources].[EmployeePayHistory]
    ADD CONSTRAINT [DF_EmployeePayHistory_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'EmployeePayHistory', @level2type = N'CONSTRAINT', @level2name = N'DF_EmployeePayHistory_ModifiedDate';


GO





ALTER TABLE [HumanResources].[EmployeePayHistory]
    ADD CONSTRAINT [CK_EmployeePayHistory_PayFrequency] CHECK ([PayFrequency]=(2) OR [PayFrequency]=(1));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [PayFrequency]=(3) OR [PayFrequency]=(2) OR [PayFrequency]=(1)', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'EmployeePayHistory', @level2type = N'CONSTRAINT', @level2name = N'CK_EmployeePayHistory_PayFrequency';


GO





ALTER TABLE [HumanResources].[EmployeePayHistory]
    ADD CONSTRAINT [CK_EmployeePayHistory_Rate] CHECK ([Rate]>=(6.50) AND [Rate]<=(200.00));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [Rate] >= (6.50) AND [Rate] <= (200.00)', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'EmployeePayHistory', @level2type = N'CONSTRAINT', @level2name = N'CK_EmployeePayHistory_Rate';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Employee pay history.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'EmployeePayHistory';


GO





CREATE TABLE [HumanResources].[JobCandidate] (
    [JobCandidateID]   INT                                                      IDENTITY (1, 1) NOT NULL,
    [BusinessEntityID] INT                                                      NULL,
    [Resume]           XML(CONTENT [HumanResources].[HRResumeSchemaCollection]) NULL,
    [ModifiedDate]     DATETIME                                                 NOT NULL
);


GO

ALTER TABLE [HumanResources].[JobCandidate]
    ADD CONSTRAINT [PK_JobCandidate_JobCandidateID] PRIMARY KEY CLUSTERED ([JobCandidateID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'JobCandidate', @level2type = N'CONSTRAINT', @level2name = N'PK_JobCandidate_JobCandidateID';


GO





ALTER TABLE [HumanResources].[JobCandidate]
    ADD CONSTRAINT [FK_JobCandidate_Employee_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Employee.EmployeeID.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'JobCandidate', @level2type = N'CONSTRAINT', @level2name = N'FK_JobCandidate_Employee_BusinessEntityID';


GO





ALTER TABLE [HumanResources].[JobCandidate]
    ADD CONSTRAINT [DF_JobCandidate_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'JobCandidate', @level2type = N'CONSTRAINT', @level2name = N'DF_JobCandidate_ModifiedDate';


GO





CREATE NONCLUSTERED INDEX [IX_JobCandidate_BusinessEntityID]
    ON [HumanResources].[JobCandidate]([BusinessEntityID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'JobCandidate', @level2type = N'INDEX', @level2name = N'IX_JobCandidate_BusinessEntityID';


GO





CREATE FULLTEXT INDEX ON [HumanResources].[JobCandidate]
    ([Resume] LANGUAGE 1033)
    KEY INDEX [PK_JobCandidate_JobCandidateID]
    ON [AW2016FullTextCatalog];


GO



EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Résumés submitted to Human Resources by job applicants.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'JobCandidate';


GO





CREATE TABLE [HumanResources].[Shift] (
    [ShiftID]      TINYINT      IDENTITY (1, 1) NOT NULL,
    [Name]         [dbo].[Name] NOT NULL,
    [StartTime]    TIME (7)     NOT NULL,
    [EndTime]      TIME (7)     NOT NULL,
    [ModifiedDate] DATETIME     NOT NULL
);


GO

ALTER TABLE [HumanResources].[Shift]
    ADD CONSTRAINT [PK_Shift_ShiftID] PRIMARY KEY CLUSTERED ([ShiftID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Shift', @level2type = N'CONSTRAINT', @level2name = N'PK_Shift_ShiftID';


GO





ALTER TABLE [HumanResources].[Shift]
    ADD CONSTRAINT [DF_Shift_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Shift', @level2type = N'CONSTRAINT', @level2name = N'DF_Shift_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Shift_Name]
    ON [HumanResources].[Shift]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Shift', @level2type = N'INDEX', @level2name = N'AK_Shift_Name';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Shift_StartTime_EndTime]
    ON [HumanResources].[Shift]([StartTime] ASC, [EndTime] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Shift', @level2type = N'INDEX', @level2name = N'AK_Shift_StartTime_EndTime';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Work shift lookup table.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Shift';


GO





CREATE TABLE [HumanResources].[Department] (
    [DepartmentID] SMALLINT     IDENTITY (1, 1) NOT NULL,
    [Name]         [dbo].[Name] NOT NULL,
    [GroupName]    [dbo].[Name] NOT NULL,
    [ModifiedDate] DATETIME     NOT NULL
);


GO

ALTER TABLE [HumanResources].[Department]
    ADD CONSTRAINT [PK_Department_DepartmentID] PRIMARY KEY CLUSTERED ([DepartmentID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Department', @level2type = N'CONSTRAINT', @level2name = N'PK_Department_DepartmentID';


GO





ALTER TABLE [HumanResources].[Department]
    ADD CONSTRAINT [DF_Department_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Department', @level2type = N'CONSTRAINT', @level2name = N'DF_Department_ModifiedDate';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Department_Name]
    ON [HumanResources].[Department]([Name] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Department', @level2type = N'INDEX', @level2name = N'AK_Department_Name';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lookup table containing the departments within the Adventure Works Cycles company.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Department';


GO





CREATE TABLE [HumanResources].[Employee] (
    [BusinessEntityID]  INT                 NOT NULL,
    [NationalIDNumber]  NVARCHAR (15)       NOT NULL,
    [LoginID]           NVARCHAR (256)      NOT NULL,
    [OrganizationNode]  [sys].[hierarchyid] NULL,
    [OrganizationLevel] AS                  ([OrganizationNode].[GetLevel]()),
    [JobTitle]          NVARCHAR (50)       NOT NULL,
    [BirthDate]         DATE                NOT NULL,
    [MaritalStatus]     NCHAR (1)           NOT NULL,
    [Gender]            NCHAR (1)           NOT NULL,
    [HireDate]          DATE                NOT NULL,
    [SalariedFlag]      [dbo].[Flag]        NOT NULL,
    [VacationHours]     SMALLINT            NOT NULL,
    [SickLeaveHours]    SMALLINT            NOT NULL,
    [CurrentFlag]       [dbo].[Flag]        NOT NULL,
    [rowguid]           UNIQUEIDENTIFIER    ROWGUIDCOL NOT NULL,
    [ModifiedDate]      DATETIME            NOT NULL
);


GO

ALTER TABLE [HumanResources].[Employee]
    ADD CONSTRAINT [PK_Employee_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'CONSTRAINT', @level2name = N'PK_Employee_BusinessEntityID';


GO





ALTER TABLE [HumanResources].[Employee]
    ADD CONSTRAINT [FK_Employee_Person_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Person.BusinessEntityID.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'CONSTRAINT', @level2name = N'FK_Employee_Person_BusinessEntityID';


GO





ALTER TABLE [HumanResources].[Employee]
    ADD CONSTRAINT [DF_Employee_SalariedFlag] DEFAULT ((1)) FOR [SalariedFlag];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 1 (TRUE)', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'CONSTRAINT', @level2name = N'DF_Employee_SalariedFlag';


GO





ALTER TABLE [HumanResources].[Employee]
    ADD CONSTRAINT [DF_Employee_VacationHours] DEFAULT ((0)) FOR [VacationHours];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'CONSTRAINT', @level2name = N'DF_Employee_VacationHours';


GO





ALTER TABLE [HumanResources].[Employee]
    ADD CONSTRAINT [DF_Employee_SickLeaveHours] DEFAULT ((0)) FOR [SickLeaveHours];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 0', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'CONSTRAINT', @level2name = N'DF_Employee_SickLeaveHours';


GO





ALTER TABLE [HumanResources].[Employee]
    ADD CONSTRAINT [DF_Employee_CurrentFlag] DEFAULT ((1)) FOR [CurrentFlag];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of 1', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'CONSTRAINT', @level2name = N'DF_Employee_CurrentFlag';


GO





ALTER TABLE [HumanResources].[Employee]
    ADD CONSTRAINT [DF_Employee_rowguid] DEFAULT (newid()) FOR [rowguid];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of NEWID()', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'CONSTRAINT', @level2name = N'DF_Employee_rowguid';


GO





ALTER TABLE [HumanResources].[Employee]
    ADD CONSTRAINT [DF_Employee_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'CONSTRAINT', @level2name = N'DF_Employee_ModifiedDate';


GO





ALTER TABLE [HumanResources].[Employee]
    ADD CONSTRAINT [CK_Employee_BirthDate] CHECK ([BirthDate]>='1930-01-01' AND [BirthDate]<=dateadd(year,(-18),getdate()));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [BirthDate] >= ''1930-01-01'' AND [BirthDate] <= dateadd(year,(-18),GETDATE())', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'CONSTRAINT', @level2name = N'CK_Employee_BirthDate';


GO





ALTER TABLE [HumanResources].[Employee]
    ADD CONSTRAINT [CK_Employee_MaritalStatus] CHECK (upper([MaritalStatus])='S' OR upper([MaritalStatus])='M');


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [MaritalStatus]=''s'' OR [MaritalStatus]=''m'' OR [MaritalStatus]=''S'' OR [MaritalStatus]=''M''', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'CONSTRAINT', @level2name = N'CK_Employee_MaritalStatus';


GO





ALTER TABLE [HumanResources].[Employee]
    ADD CONSTRAINT [CK_Employee_HireDate] CHECK ([HireDate]>='1996-07-01' AND [HireDate]<=dateadd(day,(1),getdate()));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [HireDate] >= ''1996-07-01'' AND [HireDate] <= dateadd(day,(1),GETDATE())', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'CONSTRAINT', @level2name = N'CK_Employee_HireDate';


GO





ALTER TABLE [HumanResources].[Employee]
    ADD CONSTRAINT [CK_Employee_Gender] CHECK (upper([Gender])='F' OR upper([Gender])='M');


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [Gender]=''f'' OR [Gender]=''m'' OR [Gender]=''F'' OR [Gender]=''M''', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'CONSTRAINT', @level2name = N'CK_Employee_Gender';


GO





ALTER TABLE [HumanResources].[Employee]
    ADD CONSTRAINT [CK_Employee_VacationHours] CHECK ([VacationHours]>=(-40) AND [VacationHours]<=(240));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [VacationHours] >= (-40) AND [VacationHours] <= (240)', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'CONSTRAINT', @level2name = N'CK_Employee_VacationHours';


GO





ALTER TABLE [HumanResources].[Employee]
    ADD CONSTRAINT [CK_Employee_SickLeaveHours] CHECK ([SickLeaveHours]>=(0) AND [SickLeaveHours]<=(120));


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [SickLeaveHours] >= (0) AND [SickLeaveHours] <= (120)', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'CONSTRAINT', @level2name = N'CK_Employee_SickLeaveHours';


GO





CREATE NONCLUSTERED INDEX [IX_Employee_OrganizationNode]
    ON [HumanResources].[Employee]([OrganizationNode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'INDEX', @level2name = N'IX_Employee_OrganizationNode';


GO





CREATE NONCLUSTERED INDEX [IX_Employee_OrganizationLevel_OrganizationNode]
    ON [HumanResources].[Employee]([OrganizationLevel] ASC, [OrganizationNode] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'INDEX', @level2name = N'IX_Employee_OrganizationLevel_OrganizationNode';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Employee_LoginID]
    ON [HumanResources].[Employee]([LoginID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'INDEX', @level2name = N'AK_Employee_LoginID';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Employee_NationalIDNumber]
    ON [HumanResources].[Employee]([NationalIDNumber] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'INDEX', @level2name = N'AK_Employee_NationalIDNumber';


GO





CREATE UNIQUE NONCLUSTERED INDEX [AK_Employee_rowguid]
    ON [HumanResources].[Employee]([rowguid] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique nonclustered index. Used to support replication samples.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'INDEX', @level2name = N'AK_Employee_rowguid';


GO






CREATE TRIGGER [HumanResources].[dEmployee] ON [HumanResources].[Employee] 
INSTEAD OF DELETE NOT FOR REPLICATION AS 
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0 
        RETURN;

    SET NOCOUNT ON;

    BEGIN
        RAISERROR
            (N'Employees cannot be deleted. They can only be marked as not current.', -- Message
            10, -- Severity.
            1); -- State.

        -- Rollback any active or uncommittable transactions
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
    END;
END;
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'INSTEAD OF DELETE trigger which keeps Employees from being deleted.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee', @level2type = N'TRIGGER', @level2name = N'dEmployee';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Employee information such as salary, department, and title.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'Employee';


GO





CREATE TABLE [HumanResources].[EmployeeDepartmentHistory] (
    [BusinessEntityID] INT      NOT NULL,
    [DepartmentID]     SMALLINT NOT NULL,
    [ShiftID]          TINYINT  NOT NULL,
    [StartDate]        DATE     NOT NULL,
    [EndDate]          DATE     NULL,
    [ModifiedDate]     DATETIME NOT NULL
);


GO

ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]
    ADD CONSTRAINT [PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC, [StartDate] ASC, [DepartmentID] ASC, [ShiftID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'EmployeeDepartmentHistory', @level2type = N'CONSTRAINT', @level2name = N'PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID';


GO





ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]
    ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Department_DepartmentID] FOREIGN KEY ([DepartmentID]) REFERENCES [HumanResources].[Department] ([DepartmentID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Department.DepartmentID.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'EmployeeDepartmentHistory', @level2type = N'CONSTRAINT', @level2name = N'FK_EmployeeDepartmentHistory_Department_DepartmentID';


GO





ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]
    ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Employee_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Employee.EmployeeID.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'EmployeeDepartmentHistory', @level2type = N'CONSTRAINT', @level2name = N'FK_EmployeeDepartmentHistory_Employee_BusinessEntityID';


GO





ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]
    ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Shift_ShiftID] FOREIGN KEY ([ShiftID]) REFERENCES [HumanResources].[Shift] ([ShiftID]);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key constraint referencing Shift.ShiftID', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'EmployeeDepartmentHistory', @level2type = N'CONSTRAINT', @level2name = N'FK_EmployeeDepartmentHistory_Shift_ShiftID';


GO





ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]
    ADD CONSTRAINT [DF_EmployeeDepartmentHistory_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'EmployeeDepartmentHistory', @level2type = N'CONSTRAINT', @level2name = N'DF_EmployeeDepartmentHistory_ModifiedDate';


GO





ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]
    ADD CONSTRAINT [CK_EmployeeDepartmentHistory_EndDate] CHECK ([EndDate]>=[StartDate] OR [EndDate] IS NULL);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NUL', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'EmployeeDepartmentHistory', @level2type = N'CONSTRAINT', @level2name = N'CK_EmployeeDepartmentHistory_EndDate';


GO





CREATE NONCLUSTERED INDEX [IX_EmployeeDepartmentHistory_DepartmentID]
    ON [HumanResources].[EmployeeDepartmentHistory]([DepartmentID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'EmployeeDepartmentHistory', @level2type = N'INDEX', @level2name = N'IX_EmployeeDepartmentHistory_DepartmentID';


GO





CREATE NONCLUSTERED INDEX [IX_EmployeeDepartmentHistory_ShiftID]
    ON [HumanResources].[EmployeeDepartmentHistory]([ShiftID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nonclustered index.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'EmployeeDepartmentHistory', @level2type = N'INDEX', @level2name = N'IX_EmployeeDepartmentHistory_ShiftID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Employee department transfers.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'TABLE', @level1name = N'EmployeeDepartmentHistory';


GO






CREATE VIEW [HumanResources].[vEmployee] 
AS 
SELECT 
    e.[BusinessEntityID]
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
    ,sp.[Name] AS [StateProvinceName] 
    ,a.[PostalCode]
    ,cr.[Name] AS [CountryRegionName] 
    ,p.[AdditionalContactInfo]
FROM [HumanResources].[Employee] e
	INNER JOIN [Person].[Person] p
	ON p.[BusinessEntityID] = e.[BusinessEntityID]
    INNER JOIN [Person].[BusinessEntityAddress] bea 
    ON bea.[BusinessEntityID] = e.[BusinessEntityID] 
    INNER JOIN [Person].[Address] a 
    ON a.[AddressID] = bea.[AddressID]
    INNER JOIN [Person].[StateProvince] sp 
    ON sp.[StateProvinceID] = a.[StateProvinceID]
    INNER JOIN [Person].[CountryRegion] cr 
    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]
    LEFT OUTER JOIN [Person].[PersonPhone] pp
    ON pp.BusinessEntityID = p.[BusinessEntityID]
    LEFT OUTER JOIN [Person].[PhoneNumberType] pnt
    ON pp.[PhoneNumberTypeID] = pnt.[PhoneNumberTypeID]
    LEFT OUTER JOIN [Person].[EmailAddress] ea
    ON p.[BusinessEntityID] = ea.[BusinessEntityID];
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Employee names and addresses.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'VIEW', @level1name = N'vEmployee';


GO






CREATE VIEW [HumanResources].[vEmployeeDepartment] 
AS 
SELECT 
    e.[BusinessEntityID] 
    ,p.[Title] 
    ,p.[FirstName] 
    ,p.[MiddleName] 
    ,p.[LastName] 
    ,p.[Suffix] 
    ,e.[JobTitle]
    ,d.[Name] AS [Department] 
    ,d.[GroupName] 
    ,edh.[StartDate] 
FROM [HumanResources].[Employee] e
	INNER JOIN [Person].[Person] p
	ON p.[BusinessEntityID] = e.[BusinessEntityID]
    INNER JOIN [HumanResources].[EmployeeDepartmentHistory] edh 
    ON e.[BusinessEntityID] = edh.[BusinessEntityID] 
    INNER JOIN [HumanResources].[Department] d 
    ON edh.[DepartmentID] = d.[DepartmentID] 
WHERE edh.EndDate IS NULL
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Returns employee name, title, and current department.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'VIEW', @level1name = N'vEmployeeDepartment';


GO






CREATE VIEW [HumanResources].[vEmployeeDepartmentHistory] 
AS 
SELECT 
    e.[BusinessEntityID] 
    ,p.[Title] 
    ,p.[FirstName] 
    ,p.[MiddleName] 
    ,p.[LastName] 
    ,p.[Suffix] 
    ,s.[Name] AS [Shift]
    ,d.[Name] AS [Department] 
    ,d.[GroupName] 
    ,edh.[StartDate] 
    ,edh.[EndDate]
FROM [HumanResources].[Employee] e
	INNER JOIN [Person].[Person] p
	ON p.[BusinessEntityID] = e.[BusinessEntityID]
    INNER JOIN [HumanResources].[EmployeeDepartmentHistory] edh 
    ON e.[BusinessEntityID] = edh.[BusinessEntityID] 
    INNER JOIN [HumanResources].[Department] d 
    ON edh.[DepartmentID] = d.[DepartmentID] 
    INNER JOIN [HumanResources].[Shift] s
    ON s.[ShiftID] = edh.[ShiftID];
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Returns employee name and current and previous departments.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'VIEW', @level1name = N'vEmployeeDepartmentHistory';


GO






CREATE VIEW [HumanResources].[vJobCandidate] 
AS 
SELECT 
    jc.[JobCandidateID] 
    ,jc.[BusinessEntityID] 
    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (/Resume/Name/Name.Prefix)[1]', 'nvarchar(30)') AS [Name.Prefix] 
    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume";
        (/Resume/Name/Name.First)[1]', 'nvarchar(30)') AS [Name.First] 
    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (/Resume/Name/Name.Middle)[1]', 'nvarchar(30)') AS [Name.Middle] 
    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (/Resume/Name/Name.Last)[1]', 'nvarchar(30)') AS [Name.Last] 
    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (/Resume/Name/Name.Suffix)[1]', 'nvarchar(30)') AS [Name.Suffix] 
    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (/Resume/Skills)[1]', 'nvarchar(max)') AS [Skills] 
    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Address/Addr.Type)[1]', 'nvarchar(30)') AS [Addr.Type]
    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Address/Addr.Location/Location/Loc.CountryRegion)[1]', 'nvarchar(100)') AS [Addr.Loc.CountryRegion]
    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Address/Addr.Location/Location/Loc.State)[1]', 'nvarchar(100)') AS [Addr.Loc.State]
    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Address/Addr.Location/Location/Loc.City)[1]', 'nvarchar(100)') AS [Addr.Loc.City]
    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Address/Addr.PostalCode)[1]', 'nvarchar(20)') AS [Addr.PostalCode]
    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (/Resume/EMail)[1]', 'nvarchar(max)') AS [EMail] 
    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (/Resume/WebSite)[1]', 'nvarchar(max)') AS [WebSite] 
    ,jc.[ModifiedDate] 
FROM [HumanResources].[JobCandidate] jc 
CROSS APPLY jc.[Resume].nodes(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
    /Resume') AS Resume(ref);
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Job candidate names and resumes.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'VIEW', @level1name = N'vJobCandidate';


GO






CREATE VIEW [HumanResources].[vJobCandidateEmployment] 
AS 
SELECT 
    jc.[JobCandidateID] 
    ,CONVERT(datetime, REPLACE([Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Emp.StartDate)[1]', 'nvarchar(20)') ,'Z', ''), 101) AS [Emp.StartDate] 
    ,CONVERT(datetime, REPLACE([Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Emp.EndDate)[1]', 'nvarchar(20)') ,'Z', ''), 101) AS [Emp.EndDate] 
    ,[Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Emp.OrgName)[1]', 'nvarchar(100)') AS [Emp.OrgName]
    ,[Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Emp.JobTitle)[1]', 'nvarchar(100)') AS [Emp.JobTitle]
    ,[Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Emp.Responsibility)[1]', 'nvarchar(max)') AS [Emp.Responsibility]
    ,[Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Emp.FunctionCategory)[1]', 'nvarchar(max)') AS [Emp.FunctionCategory]
    ,[Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Emp.IndustryCategory)[1]', 'nvarchar(max)') AS [Emp.IndustryCategory]
    ,[Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Emp.Location/Location/Loc.CountryRegion)[1]', 'nvarchar(max)') AS [Emp.Loc.CountryRegion]
    ,[Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Emp.Location/Location/Loc.State)[1]', 'nvarchar(max)') AS [Emp.Loc.State]
    ,[Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Emp.Location/Location/Loc.City)[1]', 'nvarchar(max)') AS [Emp.Loc.City]
FROM [HumanResources].[JobCandidate] jc 
CROSS APPLY jc.[Resume].nodes(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
    /Resume/Employment') AS Employment(ref);
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Displays the content from each employement history related element in the xml column Resume in the HumanResources.JobCandidate table. The content has been localized into French, Simplified Chinese and Thai. Some data may not display correctly unless supplemental language support is installed.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'VIEW', @level1name = N'vJobCandidateEmployment';


GO






CREATE VIEW [HumanResources].[vJobCandidateEducation] 
AS 
SELECT 
    jc.[JobCandidateID] 
    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Edu.Level)[1]', 'nvarchar(max)') AS [Edu.Level]
    ,CONVERT(datetime, REPLACE([Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Edu.StartDate)[1]', 'nvarchar(20)') ,'Z', ''), 101) AS [Edu.StartDate] 
    ,CONVERT(datetime, REPLACE([Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Edu.EndDate)[1]', 'nvarchar(20)') ,'Z', ''), 101) AS [Edu.EndDate] 
    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Edu.Degree)[1]', 'nvarchar(50)') AS [Edu.Degree]
    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Edu.Major)[1]', 'nvarchar(50)') AS [Edu.Major]
    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Edu.Minor)[1]', 'nvarchar(50)') AS [Edu.Minor]
    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Edu.GPA)[1]', 'nvarchar(5)') AS [Edu.GPA]
    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Edu.GPAScale)[1]', 'nvarchar(5)') AS [Edu.GPAScale]
    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Edu.School)[1]', 'nvarchar(100)') AS [Edu.School]
    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Edu.Location/Location/Loc.CountryRegion)[1]', 'nvarchar(100)') AS [Edu.Loc.CountryRegion]
    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Edu.Location/Location/Loc.State)[1]', 'nvarchar(100)') AS [Edu.Loc.State]
    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
        (Edu.Location/Location/Loc.City)[1]', 'nvarchar(100)') AS [Edu.Loc.City]
FROM [HumanResources].[JobCandidate] jc 
CROSS APPLY jc.[Resume].nodes(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
    /Resume/Education') AS [Education](ref);
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Displays the content from each education related element in the xml column Resume in the HumanResources.JobCandidate table. The content has been localized into French, Simplified Chinese and Thai. Some data may not display correctly unless supplemental language support is installed.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'VIEW', @level1name = N'vJobCandidateEducation';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains objects related to employees and departments.', @level0type = N'SCHEMA', @level0name = N'HumanResources';


GO



