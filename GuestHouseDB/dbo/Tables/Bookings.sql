CREATE TABLE [dbo].[Bookings] (
    [BookingID]    INT            NOT NULL,
    [FirstName]    NVARCHAR (50)  NOT NULL,
    [LastName]     NVARCHAR (50)  NOT NULL,
    [Address]      NVARCHAR (200) NOT NULL,
    [BookingFrom]  DATE           NOT NULL,
    [BookingTo]    DATE           NOT NULL,
    [AssignRoomID] INT            NOT NULL,
    [NoOfMembers]  INT            NULL,
    [PhoneNo]      INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([BookingID] ASC)
);

