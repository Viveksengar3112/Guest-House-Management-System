CREATE PROCEDURE [dbo].[spGetAvailableRooms]	
AS
BEGIN
	SELECT RoomNumber from dbo.Rooms where BookingStatusID=1
END
RETURN 0