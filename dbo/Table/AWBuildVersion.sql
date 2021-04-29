CREATE TABLE [dbo].[AWBuildVersion] (
    [SystemInformationID] TINYINT       IDENTITY (1, 1) NOT NULL,
    [Database Version]    NVARCHAR (25) NOT NULL,
    [VersionDate]         DATETIME      NOT NULL,
    [ModifiedDate]        DATETIME      NOT NULL
);


GO

ALTER TABLE [dbo].[AWBuildVersion]
    ADD CONSTRAINT [PK_AWBuildVersion_SystemInformationID] PRIMARY KEY CLUSTERED ([SystemInformationID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'AWBuildVersion', @level2type = N'CONSTRAINT', @level2name = N'PK_AWBuildVersion_SystemInformationID';


GO





ALTER TABLE [dbo].[AWBuildVersion]
    ADD CONSTRAINT [DF_AWBuildVersion_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Default constraint value of GETDATE()', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'AWBuildVersion', @level2type = N'CONSTRAINT', @level2name = N'DF_AWBuildVersion_ModifiedDate';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Current version number of the AdventureWorks 2016 sample database. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'AWBuildVersion';


GO



