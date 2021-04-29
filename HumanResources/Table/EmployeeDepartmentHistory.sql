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



