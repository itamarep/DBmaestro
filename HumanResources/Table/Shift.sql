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



