CREATE TABLE [dbo].[DatabaseLog] (
    [DatabaseLogID] INT            IDENTITY (1, 1) NOT NULL,
    [PostTime]      DATETIME       NOT NULL,
    [DatabaseUser]  [sysname]      NOT NULL,
    [Event]         [sysname]      NOT NULL,
    [Schema]        [sysname]      NULL,
    [Object]        [sysname]      NULL,
    [TSQL]          NVARCHAR (MAX) NOT NULL,
    [XmlEvent]      XML            NOT NULL
);


GO

ALTER TABLE [dbo].[DatabaseLog]
    ADD CONSTRAINT [PK_DatabaseLog_DatabaseLogID] PRIMARY KEY NONCLUSTERED ([DatabaseLogID] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (nonclustered) constraint', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DatabaseLog', @level2type = N'CONSTRAINT', @level2name = N'PK_DatabaseLog_DatabaseLogID';


GO





EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Audit table tracking all DDL changes made to the AdventureWorks database. Data is captured by the database trigger ddlDatabaseTriggerLog.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DatabaseLog';


GO



