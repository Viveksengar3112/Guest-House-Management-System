CREATE TABLE [Master].[BookingStatus] (
    [BookingStatusID] INT           IDENTITY (1, 1) NOT NULL,
    [BookingStatus]   NVARCHAR (30) NOT NULL,
    CONSTRAINT [PK_BookingStatus] PRIMARY KEY CLUSTERED ([BookingStatusID] ASC)
);

