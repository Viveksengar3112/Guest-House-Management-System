CREATE PROCEDURE [dbo].[spBookingDetailsCRUD]
	(
	@Action nvarchar(10),
	@AssignRoomID int,
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@PhoneNo nvarchar(10) ,
	@Members int,
	@BookingFrom datetime,
	@BookingTo datetime,
	@Address nvarchar(200),
	@Amount int=null
)
AS
BEGIN
	SET NOCOUNT ON;

	IF @Action = 'INSERT'
	BEGIN
		INSERT INTO dbo.Bookings
		(
			FirstName,
			LastName,
			Address,
			BookingFrom,
			BookingTo,
			AssignRoomID,
			NoOfMembers,
			PhoneNo
		)
		VALUES
		(
			@FirstName,
			@LastName,
			@Address,
			@BookingFrom,
			@BookingTo,
			@AssignRoomID,
			@Members,
			@PhoneNo
		)
		UPDATE dbo.Rooms
		SET BookingStatusID=2
		WHERE RoomID=@AssignRoomID
	END
END

RETURN 0