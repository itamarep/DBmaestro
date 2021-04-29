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



