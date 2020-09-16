CREATE PROCEDURE [dbo].[spInsertRoom]
(
	@RoomNumber nvarchar(8),
	@RoomPrice nvarchar(10),
	@BookingStatusID int ,
	@RoomTypeID int,
	@RoomCapacity int,
	@RoomDescription nvarchar(550),
	@GuestHouseID int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO dbo.Rooms
	(
	RoomNumber ,
	RoomPrice ,
	BookingStatusID ,
	RoomTypeID ,
	RoomCapacity, 
	RoomDescription ,
	GuestHouseID 
	)
	VALUES
	(
	@RoomNumber ,
	@RoomPrice ,
	@BookingStatusID,
	@RoomTypeID ,
	@RoomCapacity ,
	@RoomDescription ,
	@GuestHouseID 
	)

END
RETURN 0