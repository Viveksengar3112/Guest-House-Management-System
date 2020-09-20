-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
	CREATE PROCEDURE [dbo].[spInsertRegistration]
	(	
		@FirstName nvarchar(50),
		@LastName nvarchar(50),
		@EmailAddress varchar(50),
		@MobileNo nvarchar(50),
		@ID nvarchar(50)
	)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   INSERT INTO dbo.Registration 
   (
		FirstName,
		LastName,
		Email,
		MobileNo,
		ID
   )
   VALUES(
	@FirstName,
	@LastName,
	@EmailAddress,
	@MobileNo,
	@ID
   
   )
END
