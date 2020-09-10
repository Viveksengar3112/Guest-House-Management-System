CREATE TABLE [dbo].[Guest] (
    [GuestId]      INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]    NVARCHAR (50) NOT NULL,
    [LastName]     NVARCHAR (50) NOT NULL,
    [EmailAddress] NVARCHAR (50) NOT NULL,
    [MobileNo]     NVARCHAR (50) NOT NULL,
    [ID]           NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK__Guest__0C423C126815141F] PRIMARY KEY CLUSTERED ([GuestId] ASC)
);

