CREATE PROCEDURE [dbo].[spGetBookingType]
AS
BEGIN
	SELECT BookingType,BookingTypeID from Master.BookingType
END
RETURN 0