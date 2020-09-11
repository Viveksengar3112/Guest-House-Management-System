CREATE TABLE [dbo].[Rooms] (
    [RoomID]          INT            IDENTITY (1, 1) NOT NULL,
    [RoomNumber]      NVARCHAR (8)   NOT NULL,
    [RoomPrice]       NVARCHAR (10)  NOT NULL,
    [RoomImage]       NVARCHAR (550) NULL,
    [BookingStatusID] INT            NOT NULL,
    [RoomTypeID]      INT            NOT NULL,
    [RoomCapacity]    INT            NOT NULL,
    [RoomDescription] NVARCHAR (550) NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    [GuestHouseID]    INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([RoomID] ASC)
);

