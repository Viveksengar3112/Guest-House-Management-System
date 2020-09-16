CREATE PROCEDURE [dbo].[spGetRoomDetails]
	
AS
Begin
	SELECT G.Name,R.RoomNumber,R.RoomPrice,R.RoomCapacity,B.BookingStatus,T.RoomType,R.RoomDescription from dbo.Rooms R join
	Master.BookingStatus B on B.BookingStatusID=R.BookingStatusID join Master.GuestHouseIndex G on G.GuestHouseID=R.GuestHouseID join
	Master.RoomType T on T.RoomTypeID=R.RoomTypeID
End
RETURN 0