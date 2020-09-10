Create procedure spGetGuestById
@ID int
as 
begin
	select FirstName,LastName,EmailAddress,MobileNo,ID 
	from Guest
	where GuestId=@ID
end
