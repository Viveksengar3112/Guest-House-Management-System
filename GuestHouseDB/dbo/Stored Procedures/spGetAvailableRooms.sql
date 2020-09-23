CREATE PROCEDURE [dbo].[spGetAvailableRooms]	
@GuestHouseID int,
@RoomTypeID int 

AS
BEGIN
	SELECT R.RoomNumber from dbo.Rooms R where R.RoomTypeID=@RoomTypeID AND R.GuestHouseID=@GuestHouseID
END
RETURN 0