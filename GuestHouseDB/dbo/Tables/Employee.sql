CREATE TABLE [dbo].[Employee] (
    [EmployeeID]   INT            NOT NULL,
    [FirstName]    NVARCHAR (50)  NOT NULL,
    [LastName]     NVARCHAR (50)  NOT NULL,
    [EmailAddress] NVARCHAR (100) NOT NULL,
    [MobileNo]     INT            NULL,
    PRIMARY KEY CLUSTERED ([EmployeeID] ASC)
);

