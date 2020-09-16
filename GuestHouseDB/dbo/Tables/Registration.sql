CREATE TABLE [dbo].[Registration]
(
	[ID] NVARCHAR(50) NOT NULL , 
    [FirstName] NVARCHAR(50) NOT NULL, 
    [LastName] NVARCHAR(50) NULL, 
    [EmailAddress] VARCHAR(50) NOT NULL, 
    [MobileNo] NVARCHAR(50) NOT NULL, 
    PRIMARY KEY ([EmailAddress])
)
